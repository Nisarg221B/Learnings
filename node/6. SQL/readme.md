### Passing Route Params and Using Query Params

- You can pass Dynamic path segments by adding a ":" to the express router path
- The name you add after ":" is the name by which you can extract the data on req.params
- Optional (query) parameters can also be passed (?myParam=value&b=2) and extracted (req.query.myParam)
