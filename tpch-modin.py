"""
Usage:
  tpch-modin.py <num> [--conn=<conn>] [--engine=<engine>] [--enable-cx]

Options:
  --conn=<conn>             The connection url to use.
  --engine=<engine>         The engine used to compute [default: Dask].
  --enable-cx               Enable connectorx instead of pandas for read_sql.
  -h --help     Show this screen.
  --version     Show version.
"""

from contexttimer import Timer
from docopt import docopt

if __name__ == "__main__":
    args = docopt(__doc__, version="1.0")

    table = "lineitem"
    conn = args["--conn"]
    partitions = int(args["<num>"])
    engine = args["--engine"]
    enable_cx = args["--enable-cx"]

    print(f"conn url: {conn}")
    print(f"enable_cx: {enable_cx}")

    if engine == "Dask":
        from dask.distributed import Client, LocalCluster
        cluster = LocalCluster(n_workers=partitions, scheduler_port=0, memory_limit="230G")
        client = Client(cluster)
    elif engine == "Ray":
        import ray
        ray.init(num_cpus=partitions)

    from modin.config import Engine, NPartitions
    NPartitions.put(partitions)
    Engine.put(engine)

    import modin.pandas as pd

    with Timer() as timer:
        df = pd.read_sql(
            f"SELECT * FROM {table}",
            str(conn),
            parse_dates=[
                "l_shipdate",
                "l_commitdate",
                "l_receiptdate",
                "L_SHIPDATE",
                "L_COMMITDATE",
                "L_RECEIPTDATE",
            ],
            enable_cx=enable_cx,
        )
    print(f"[Total] {timer.elapsed:.2f}s")

    print(df.head())
    print(len(df))
    print(df.dtypes)
