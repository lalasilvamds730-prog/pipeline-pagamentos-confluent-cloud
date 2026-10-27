
import argparse
import csv
import random
from datetime import datetime, timezone, timedelta
from pathlib import Path

def main():
    parser = argparse.ArgumentParser(
        description="Gera pagamentos fictícios para testes."
    )
    parser.add_argument("--output", default="pagamentos_teste.csv")
    parser.add_argument("--count", type=int, default=20)
    parser.add_argument("--seed", type=int, default=42)
    args = parser.parse_args()

    if args.count < 3:
        parser.error("--count precisa ser pelo menos 3.")

    rng = random.Random(args.seed)
    agora = datetime.now(timezone.utc)
    pagamentos = []

    # Três pagamentos do mesmo cartão em 20 segundos
    for numero, segundos in enumerate([20, 10, 0], start=1):
        pagamentos.append({
            "transaction_id": numero,
            "card_id": 1,
            "merchant_id": numero,
            "amount": f"{rng.uniform(20, 350):.2f}",
            "transaction_time": (
                agora - timedelta(seconds=segundos)
            ).isoformat(),
            "status": "APPROVED"
        })

    # Outros pagamentos aleatórios para ampliar os testes
    for numero in range(4, args.count + 1):
        pagamentos.append({
            "transaction_id": numero,
            "card_id": rng.randint(1, 10),
            "merchant_id": rng.randint(1, 20),
            "amount": f"{rng.uniform(5, 1500):.2f}",
            "transaction_time": (
                agora - timedelta(minutes=rng.randint(1, 1440))
            ).isoformat(),
            "status": rng.choice([
                "APPROVED", "APPROVED", "DECLINED"
            ])
        })

    arquivo = Path(args.output)
    arquivo.parent.mkdir(parents=True, exist_ok=True)

    with arquivo.open("w", newline="", encoding="utf-8") as csvfile:
        colunas = [
            "transaction_id",
            "card_id",
            "merchant_id",
            "amount",
            "transaction_time",
            "status"
        ]
        writer = csv.DictWriter(csvfile, fieldnames=colunas)
        writer.writeheader()
        writer.writerows(pagamentos)

    print(f"Arquivo criado: {arquivo.resolve()}")
    print(f"Pagamentos gerados: {len(pagamentos)}")
    print("Cenário incluído: 3 pagamentos do cartão 1 em 20 segundos.")

if __name__ == "__main__":
    main()
