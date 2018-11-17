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
Cables:  10 connections 100 streams          0.99         1.01 s     ±4.50%         1.00 s         1.08 s
Cables:   5 connections 10 streams           0.95         1.05 s     ±7.43%         1.02 s         1.23 s
Cables: 100 connections 100 streams          0.92         1.09 s     ±3.86%         1.08 s         1.19 s
Cables:  10 connections 5 streams            0.85         1.18 s    ±10.46%         1.23 s         1.43 s
Cables:  50 connections 1 streams            0.84         1.19 s     ±3.18%         1.17 s         1.27 s
Hackney: 100 connection                      0.76         1.32 s     ±3.24%         1.30 s         1.38 s
Hackney:  50 connection                      0.76         1.32 s     ±2.58%         1.32 s         1.36 s
Cables: 100 connections   1 stream           0.71         1.42 s     ±4.64%         1.38 s         1.53 s
Cables:   2 connections 25 streams           0.63         1.60 s     ±4.59%         1.61 s         1.72 s
Cables:   1 connection 50 streams            0.37         2.73 s     ±3.49%         2.72 s         2.88 s
Cables:   1 connection 1 stream              0.26         3.82 s     ±6.41%         3.84 s         4.11 s
Hackney:   1 connection                     0.163         6.15 s     ±0.13%         6.15 s         6.16 s

Comparison: 
Cables:  10 connections 100 streams          0.99
Cables:   5 connections 10 streams           0.95 - 1.04x slower
Cables: 100 connections 100 streams          0.92 - 1.08x slower
Cables:  10 connections 5 streams            0.85 - 1.17x slower
Cables:  50 connections 1 streams            0.84 - 1.18x slower
Hackney: 100 connection                      0.76 - 1.30x slower
Hackney:  50 connection                      0.76 - 1.30x slower
Cables: 100 connections   1 stream           0.71 - 1.40x slower
Cables:   2 connections 25 streams           0.63 - 1.58x slower
Cables:   1 connection 50 streams            0.37 - 2.70x slower
Cables:   1 connection 1 stream              0.26 - 3.78x slower
Hackney:   1 connection                     0.163 - 6.08x slower
```
# Small Responses with Headers (15 bytes)

```
Name                                                    ips        average  deviation         median         99th %
Cables (Headers):  10 connections 5 streams            0.78         1.28 s     ±1.80%         1.28 s         1.32 s
Cables (Headers):  10 connections 100 streams          0.75         1.33 s     ±3.67%         1.31 s         1.43 s
Cables (Headers):   5 connections 10 streams           0.74         1.36 s     ±2.85%         1.36 s         1.41 s
Hackney (Headers):  50 connection                      0.73         1.36 s     ±2.83%         1.36 s         1.44 s
Cables (Headers): 100 connections 100 streams          0.71         1.41 s     ±3.29%         1.39 s         1.49 s
Cables (Headers):  50 connections 1 streams            0.67         1.49 s     ±1.10%         1.49 s         1.51 s
Hackney (Headers): 100 connection                      0.59         1.69 s    ±11.63%         1.68 s         2.04 s
Cables (Headers): 100 connections 1 stream             0.57         1.75 s     ±3.62%         1.74 s         1.87 s
Cables (Headers):   2 connections 25 streams           0.45         2.23 s     ±1.58%         2.23 s         2.29 s
Cables (Headers):   1 connection 50 streams            0.27         3.75 s     ±4.97%         3.72 s         4.00 s
Cables (Headers):   1 connection 1 stream              0.21         4.70 s     ±2.52%         4.68 s         4.86 s
Hackney (Headers):   1 connection                     0.142         7.06 s     ±2.89%         7.06 s         7.27 s

Comparison: 
Cables (Headers):  10 connections 5 streams            0.78
Cables (Headers):  10 connections 100 streams          0.75 - 1.04x slower
Cables (Headers):   5 connections 10 streams           0.74 - 1.06x slower
Hackney (Headers):  50 connection                      0.73 - 1.06x slower
Cables (Headers): 100 connections 100 streams          0.71 - 1.10x slower
Cables (Headers):  50 connections 1 streams            0.67 - 1.16x slower
Hackney (Headers): 100 connection                      0.59 - 1.32x slower
Cables (Headers): 100 connections 1 stream             0.57 - 1.37x slower
Cables (Headers):   2 connections 25 streams           0.45 - 1.74x slower
Cables (Headers):   1 connection 50 streams            0.27 - 2.93x slower
Cables (Headers):   1 connection 1 stream              0.21 - 3.67x slower
Hackney (Headers):   1 connection                     0.142 - 5.51x slower
```

# Medium Response (1500 bytes)

```
Name                                          ips        average  deviation         median         99th %
Cables:  10 connections 100 streams          0.81         1.24 s     ±2.26%         1.25 s         1.28 s
Cables:  10 connections 5 streams            0.80         1.26 s     ±4.26%         1.25 s         1.37 s
Cables: 100 connections 100 streams          0.78         1.29 s     ±1.41%         1.29 s         1.32 s
Cables:   5 connections 10 streams           0.74         1.35 s     ±9.20%         1.33 s         1.54 s
Cables:  50 connections 1 streams            0.65         1.54 s     ±6.57%         1.56 s         1.68 s
Hackney: 100 connection                      0.63         1.58 s     ±2.32%         1.56 s         1.64 s
Hackney:  50 connection                      0.60         1.67 s    ±10.54%         1.62 s         2.02 s
Cables: 100 connections   1 stream           0.58         1.74 s     ±3.64%         1.76 s         1.81 s
Cables:   2 connections 25 streams           0.51         1.95 s     ±1.25%         1.93 s         1.99 s
Cables:   1 connection 50 streams            0.31         3.25 s     ±2.26%         3.25 s         3.34 s
Cables:   1 connection 1 stream             0.192         5.20 s     ±0.56%         5.20 s         5.23 s
Hackney:   1 connection                     0.118         8.46 s     ±1.15%         8.46 s         8.56 s

Comparison: 
Cables:  10 connections 100 streams          0.81
Cables:  10 connections 5 streams            0.80 - 1.01x slower
Cables: 100 connections 100 streams          0.78 - 1.04x slower
Cables:   5 connections 10 streams           0.74 - 1.09x slower
Cables:  50 connections 1 streams            0.65 - 1.25x slower
Hackney: 100 connection                      0.63 - 1.27x slower
Hackney:  50 connection                      0.60 - 1.35x slower
Cables: 100 connections   1 stream           0.58 - 1.40x slower
Cables:   2 connections 25 streams           0.51 - 1.57x slower
Cables:   1 connection 50 streams            0.31 - 2.62x slower
Cables:   1 connection 1 stream             0.192 - 4.19x slower
Hackney:   1 connection                     0.118 - 6.83x slower
```

# Large Response (15000 bytes)

```
Name                                          ips        average  deviation         median         99th %
Cables:  10 connections 100 streams          0.38         2.66 s     ±2.10%         2.65 s         2.74 s
Cables:   5 connections 10 streams           0.37         2.69 s     ±1.72%         2.68 s         2.76 s
Cables:  10 connections 5 streams            0.36         2.79 s     ±4.29%         2.79 s         2.94 s
Cables:  50 connections 1 streams            0.34         2.91 s     ±2.57%         2.92 s         2.99 s
Cables: 100 connections 100 streams          0.34         2.98 s     ±5.20%         2.93 s         3.24 s
Hackney: 100 connection                      0.32         3.08 s     ±4.99%         3.10 s         3.25 s
Cables: 100 connections   1 stream           0.32         3.09 s     ±3.49%         3.07 s         3.24 s
Hackney:  50 connection                      0.32         3.16 s     ±2.96%         3.16 s         3.26 s
Cables:   2 connections 25 streams           0.28         3.63 s     ±1.83%         3.61 s         3.72 s
Cables:   1 connection 50 streams           0.161         6.21 s     ±0.58%         6.21 s         6.24 s
Cables:   1 connection 1 stream            0.0881        11.35 s     ±0.00%        11.35 s        11.35 s
Hackney:   1 connection                    0.0771        12.98 s     ±0.00%        12.98 s        12.98 s

Comparison: 
Cables:  10 connections 100 streams          0.38
Cables:   5 connections 10 streams           0.37 - 1.01x slower
Cables:  10 connections 5 streams            0.36 - 1.05x slower
Cables:  50 connections 1 streams            0.34 - 1.09x slower
Cables: 100 connections 100 streams          0.34 - 1.12x slower
Hackney: 100 connection                      0.32 - 1.16x slower
Cables: 100 connections   1 stream           0.32 - 1.16x slower
Hackney:  50 connection                      0.32 - 1.19x slower
Cables:   2 connections 25 streams           0.28 - 1.37x slower
Cables:   1 connection 50 streams           0.161 - 2.34x slower
Cables:   1 connection 1 stream            0.0881 - 4.27x slower
Hackney:   1 connection                    0.0771 - 4.89x slower
```
