FROM rocker/r-base 
RUN apt update && apt -y upgrade && \
    apt install -y libcurl4-openssl-dev libssl-dev libxml2-dev && \
    apt clean && \
    Rscript -e 'install.packages(c("tidyverse", "readxl", "tidybayes", "JuliaCall"), repos="https://cloud.r-project.org")' && \
    wget https://julialang-s3.julialang.org/bin/linux/x64/1.5/julia-1.5.4-linux-x86_64.tar.gz && \
    tar zxvf julia-1.5.4-linux-x86_64.tar.gz && \
    julia-1.5.4/bin/julia -e 'using Pkg; Pkg.add(["RCall","Random","Plots","Turing","Distributions","StatsPlots","DataFrames","MCMCChains","CSV"]); Pkg.build(["RCall","Random","Plots","Turing","Distributions","StatsPlots","DataFrames","MCMCChains","CSV"]); Pkg.precompile()'
