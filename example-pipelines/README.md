# Example Concourse Pipelines

To use one of the pipelines in this folder, use the `fly` CLI's [set-pipeline command](https://concourse-ci.org/setting-pipelines.html#setting-pipelines):

`fly -t your_target_name set-pipeline --pipeline your_pipeline_name -c example_pipeline_filename.yaml`

Now, you can trigger the pipeline and watch the output in the CLI (or web UI) using the [trigger job command](https://concourse-ci.org/jobs.html#fly-trigger-job):

`fly -t your_target_name trigger-job --job your_pipeline_name/contrast --watch`