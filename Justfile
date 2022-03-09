set dotenv-load := true

install-dependencies:
    cd modin && pip install -r requirements-dev.txt
    pip install docopt contexttimer psycopg2-binary connectorx

compile-modin:
    cd modin && python setup.py install

postgres num="1" +args="":
    python tpch-modin.py {{num}} --conn $POSTGRES_URL {{args}}
