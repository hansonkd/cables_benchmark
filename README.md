# CablesBenchmark

This benchmark tests opening 10,000 simultaneous requests using different configuration of maximum connections and maximum streams.

The Benchmark also tests against HTTP/1.1 using Hackney.

It tests sending responses with no headers and recieving requests with no headers and sending responses with static headers (in order to test HPACK).

```
mix run scripts/bench.exs
```

# Small Responses (15 bytes)

```
Name                                          ips        average  deviation         median         99th %
Cables:  10 connections 100 streams          1.04         0.96 s     ±1.61%         0.96 s         0.99 s
Cables:  10 connections 5 streams            1.02         0.98 s     ±2.39%         0.98 s         1.02 s
Cables:   5 connections 10 streams           0.99         1.01 s     ±2.36%         1.02 s         1.04 s
Cables: 100 connections 100 streams          0.95         1.05 s     ±2.71%         1.04 s         1.09 s
Cables:  50 connections 1 streams            0.86         1.17 s     ±3.01%         1.16 s         1.24 s
Hackney:  50 connection                      0.80         1.25 s     ±2.26%         1.25 s         1.32 s
Hackney: 100 connection                      0.79         1.26 s     ±2.29%         1.27 s         1.30 s
Cables: 100 connections   1 stream           0.75         1.34 s     ±2.56%         1.33 s         1.39 s
Cables:   2 connections 25 streams           0.62         1.62 s     ±2.45%         1.63 s         1.67 s
Cables:   1 connection 50 streams            0.39         2.57 s     ±2.70%         2.54 s         2.68 s
Cables:   1 connection 1 stream              0.26         3.91 s     ±1.07%         3.88 s         3.96 s
Hackney:   1 connection                     0.185         5.40 s     ±1.96%         5.40 s         5.51 s

Comparison:
Cables:  10 connections 100 streams          1.04
Cables:  10 connections 5 streams            1.02 - 1.01x slower
Cables:   5 connections 10 streams           0.99 - 1.05x slower
Cables: 100 connections 100 streams          0.95 - 1.09x slower
Cables:  50 connections 1 streams            0.86 - 1.21x slower
Hackney:  50 connection                      0.80 - 1.30x slower
Hackney: 100 connection                      0.79 - 1.31x slower
Cables: 100 connections   1 stream           0.75 - 1.39x slower
Cables:   2 connections 25 streams           0.62 - 1.68x slower
Cables:   1 connection 50 streams            0.39 - 2.67x slower
Cables:   1 connection 1 stream              0.26 - 4.06x slower
Hackney:   1 connection                     0.185 - 5.61x slower
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