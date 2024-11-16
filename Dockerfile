FROM redis:6-alpine

#tao thu muc lam viec 
RUN mkdir -p /redis-sentinel
RUN mkdir -p /redis-sentinel/data && \
    mkdir -p /redis-sentinel/logs

# thu muc lam viec
WORKDIR /redis-sentinel

# Copy file sentinel.conf vao container
COPY sentinel.conf /redis-sentinel/sentinel.conf

# Copy script entrypoint
COPY sentinel-entrypoint.sh /usr/local/bin/

# thiet lap quyen thuc thi va so huu file
RUN chown redis:redis /redis-sentinel/* && \
    chmod +x /usr/local/bin/sentinel-entrypoint.sh

# mo port  26379 cho Redis Sentinel
EXPOSE 26379

# dat entrypoint cho contaienr thu thi lenh chay service sentinel
ENTRYPOINT ["redis-server", "/redis/sentinel.conf", "--sentinel"]
