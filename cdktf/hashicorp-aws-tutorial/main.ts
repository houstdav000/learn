import { Construct } from "constructs";
import { App, TerraformStack, TerraformOutput } from "cdktf";
import { AwsProvider, s3 } from "@cdktf/provider-aws";

class MyStack extends TerraformStack {
  constructor(scope: Construct, id: string) {
    super(scope, id);

    new AwsProvider(this, "AWS", {
      region: "us-east-1",
      profile: "personal",
    });

    const bucket = new s3.S3Bucket(this, "MySecondBucket", {
      tags:
    });

    new TerraformOutput(this, "public_ip", {
      value: instance.publicIp
    });
  }
}

const app = new App();
new MyStack(app, "aws_instance");
app.synth();
