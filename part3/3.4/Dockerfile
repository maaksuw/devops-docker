# Start from Docker
FROM docker

# Copy the builder.sh file from this directory to /
COPY builder.sh .

# Add execution permissions during the build
RUN chmod +x builder.sh

# Start from builder.sh so we can give parameters to it
ENTRYPOINT ["./builder.sh"]
