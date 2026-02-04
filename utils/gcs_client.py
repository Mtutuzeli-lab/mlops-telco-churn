from google.cloud import storage

def get_gcs_client(project=None):
    return storage.Client(project=project)
