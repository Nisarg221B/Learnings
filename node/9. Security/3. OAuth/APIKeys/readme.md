### API keys

API keys are project centric credential that serve two purposes:
- Project Identification
    - Identify the app or the project thats making a call to the API or SDK
- Project Authorization
    - Check whether the calling app has been granted acccess to call the API or SDK and has enabled the API or SDK in the project

When an API key is created, it is associated with a project. By identifying the calling project, an API key enables usage information to be associated with that project, and helps ensure calls from other projects are rejected.

- related http status code - 429 Too Many Requests ("rate limiting") + retry-after header  in the response

