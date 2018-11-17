# CablesBenchmark

This benchmark tests opening 10,000 simultaneous requests using different configuration of maximum connections and maximum streams.

The Benchmark also tests against HTTP/1.1 using Hackney.

It tests sending responses with no headers and recieving requests with no headers and sending responses with static headers (in order to test HPACK).

```
mix run scripts/bench.exs
```

# Small Responses (15 bytes)

```
Name                                          ips        average  deviation         median
Cables:  10 connections 100 streams          0.89         1.13 s     ±1.44%         1.12 s
Cables:  10 connections 5 streams            0.88         1.13 s     ±1.27%         1.13 s
Cables:   5 connections 10 streams           0.87         1.15 s     ±2.38%         1.15 s
Cables: 100 connections 100 streams          0.81         1.23 s     ±1.83%         1.23 s
Cables:  50 connections 1 streams            0.75         1.34 s     ±2.04%         1.33 s
Hackney:  50 connection                      0.69         1.45 s     ±1.87%         1.45 s
Cables: 100 connections   1 stream           0.66         1.52 s     ±0.93%         1.52 s
Hackney: 100 connection                      0.62         1.62 s    ±17.99%         1.51 s
Cables:   2 connections 25 streams           0.53         1.89 s     ±1.75%         1.89 s
Cables:   1 connection 50 streams            0.33         3.03 s     ±3.38%         3.00 s
Cables:   1 connection 1 stream              0.22         4.53 s     ±2.88%         4.62 s
Hackney:   1 connection                     0.128         7.81 s     ±0.57%         7.81 s

Comparison:
Cables:  10 connections 100 streams          0.89
Cables:  10 connections 5 streams            0.88 - 1.00x slower
Cables:   5 connections 10 streams           0.87 - 1.02x slower
Cables: 100 connections 100 streams          0.81 - 1.09x slower
Cables:  50 connections 1 streams            0.75 - 1.19x slower
Hackney:  50 connection                      0.69 - 1.29x slower
Cables: 100 connections   1 stream           0.66 - 1.35x slower
Hackney: 100 connection                      0.62 - 1.44x slower
Cables:   2 connections 25 streams           0.53 - 1.68x slower
Cables:   1 connection 50 streams            0.33 - 2.70x slower
Cables:   1 connection 1 stream              0.22 - 4.03x slower
Hackney:   1 connection                     0.128 - 6.94x slower
```
# Small Responses with Headers (15 bytes)

```
Name                                                    ips        average  deviation         median
Cables (Headers):  10 connections 5 streams            0.78         1.28 s     ±1.19%         1.28 s
Cables (Headers):  10 connections 100 streams          0.76         1.32 s     ±1.97%         1.32 s
Hackney (Headers): 100 connection                      0.75         1.34 s     ±1.81%         1.33 s
Hackney (Headers):  50 connection                      0.74         1.36 s     ±1.94%         1.35 s
Cables (Headers):   5 connections 10 streams           0.73         1.38 s     ±2.01%         1.37 s
Cables (Headers): 100 connections 100 streams          0.71         1.41 s     ±2.48%         1.41 s
Cables (Headers):  50 connections 1 streams            0.67         1.48 s     ±1.04%         1.48 s
Cables (Headers): 100 connections 1 stream             0.59         1.71 s     ±1.37%         1.70 s
Cables (Headers):   2 connections 25 streams           0.45         2.24 s     ±3.17%         2.25 s
Cables (Headers):   1 connection 50 streams            0.28         3.51 s     ±1.59%         3.48 s
Cables (Headers):   1 connection 1 stream              0.26         3.78 s     ±1.94%         3.78 s
Hackney (Headers):   1 connection                     0.140         7.12 s     ±0.93%         7.12 s

Comparison:
Cables (Headers):  10 connections 5 streams            0.78
Cables (Headers):  10 connections 100 streams          0.76 - 1.03x slower
Hackney (Headers): 100 connection                      0.75 - 1.04x slower
Hackney (Headers):  50 connection                      0.74 - 1.06x slower
Cables (Headers):   5 connections 10 streams           0.73 - 1.08x slower
Cables (Headers): 100 connections 100 streams          0.71 - 1.10x slower
Cables (Headers):  50 connections 1 streams            0.67 - 1.16x slower
Cables (Headers): 100 connections 1 stream             0.59 - 1.34x slower
Cables (Headers):   2 connections 25 streams           0.45 - 1.75x slower
Cables (Headers):   1 connection 50 streams            0.28 - 2.75x slower
Cables (Headers):   1 connection 1 stream              0.26 - 2.95x slower
Hackney (Headers):   1 connection                     0.140 - 5.57x slower
```

# Medium Response (1500 bytes)

```
Name                                          ips        average  deviation         median
Cables:  10 connections 100 streams          0.87         1.16 s     ±2.49%         1.17 s
Cables:   5 connections 10 streams           0.86         1.16 s     ±1.82%         1.16 s
Cables:  10 connections 5 streams            0.85         1.18 s     ±5.61%         1.14 s
Cables: 100 connections 100 streams          0.78         1.28 s     ±3.84%         1.29 s
Cables:  50 connections 1 streams            0.73         1.37 s     ±1.34%         1.38 s
Hackney:  50 connection                      0.68         1.46 s     ±1.74%         1.47 s
Hackney: 100 connection                      0.66         1.51 s     ±3.91%         1.48 s
Cables: 100 connections   1 stream           0.62         1.63 s     ±6.34%         1.58 s
Cables:   2 connections 25 streams           0.53         1.89 s     ±2.19%         1.91 s
Cables:   1 connection 50 streams            0.33         3.06 s     ±3.39%         3.07 s
Cables:   1 connection 1 stream              0.22         4.58 s     ±2.14%         4.58 s
Hackney:   1 connection                     0.124         8.05 s     ±0.62%         8.05 s

Comparison:
Cables:  10 connections 100 streams          0.87
Cables:   5 connections 10 streams           0.86 - 1.00x slower
Cables:  10 connections 5 streams            0.85 - 1.02x slower
Cables: 100 connections 100 streams          0.78 - 1.11x slower
Cables:  50 connections 1 streams            0.73 - 1.19x slower
Hackney:  50 connection                      0.68 - 1.27x slower
Hackney: 100 connection                      0.66 - 1.30x slower
Cables: 100 connections   1 stream           0.62 - 1.41x slower
Cables:   2 connections 25 streams           0.53 - 1.64x slower
Cables:   1 connection 50 streams            0.33 - 2.65x slower
Cables:   1 connection 1 stream              0.22 - 3.97x slower
Hackney:   1 connection                     0.124 - 6.97x slower
```