import base64

def hello():
    return base64.b64decode("SGVsbG8sIFdvcmxkIQ==").decode("utf-8", "ignore");
