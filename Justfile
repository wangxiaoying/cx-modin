compile-modin:
    cd modin && python setup.py install

postgres num="1" +args="":
    python tpch-modin.py {{num}} --conn postgresql://postgres:postgres@postgres.xiaoying.svc.cluster.dsl:5432/tpch {{args}}