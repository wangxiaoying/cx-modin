set dotenv-load := true

compile-modin:
    cd modin && python setup.py install

postgres num="1" +args="":
    python tpch-modin.py {{num}} --conn $POSTGRES_URL {{args}}