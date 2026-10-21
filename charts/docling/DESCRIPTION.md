Docling is a document parsing tool, in this case deployed as a server via docling-serve.

This is by default deployed as an api + valkey + worker, to enable queues and more robust processing of documents. This also enables the UI to make it easier to experiment with.

```mermaid
flowchart TB
    User([User])

    subgraph K8s["Kubernetes Cluster"]
        subgraph API["docling-serve-ui-api-pod"]
            UI["UI / API Container<br/>Docling Serve"]
        end

        subgraph VK["valkey-pod"]
            Valkey[("Valkey<br/>Cache / Queue")]
        end

        subgraph Worker["docling-worker-pod"]
            Processor["Document Processing Worker"]
        end

        UI <-->|"Read / Write<br/>Cache / Queue"| Valkey
        Processor <-->|"Consume jobs / Update status"| Valkey
    end

    User -->|"HTTP / HTTPS<br>ingress / httproute"| UI

classDef plain fill:#ddd,stroke:#fff,stroke-width:4px,color:#000;
classDef k8s fill:#326ce5,stroke:#fff,stroke-width:4px,color:#fff;
classDef cluster fill:#fff,stroke:#bbb,stroke-width:2px,color:#326ce5;
class UI,Valkey,Processor k8s;
class worker plain;
class K8s cluster;
```
