*A curated list of awesome AMD ROCm and Instinct GPU resources for AI, ML, and HPC.*

From running large language models and fine-tuning foundation models to distributed training,
high-throughput inference, and scientific simulation — AMD's GPU stack powers the full AI
development lifecycle. [ROCm](https://rocm.docs.amd.com/en/latest/) is the open-source software
platform that makes it possible, and [Instinct](https://www.amd.com/en/products/accelerators/instinct.html)
accelerators (MI300X, MI325X, MI350X) are the hardware it was built for. [Radeon Pro](https://www.amd.com/en/products/graphics/workstations.html)
workstation GPUs, consumer [Radeon](https://www.amd.com/en/products/graphics.html) RDNA 3/4 GPUs,
and Ryzen APUs round out the ecosystem for local development and inference.

This list collects the best official docs, open-source tools, reference architectures, and community
resources for getting things done on AMD hardware.

## Contents

🏗️ [Core Infrastructure](#️-core-infrastructure) — Hardware, ROCm stack, networking, and virtualization<br>
🐳 [Container \& Orchestration Hub](#-container--orchestration-hub) — Docker images and Kubernetes GPU management<br>
🤖 [AI / ML Frameworks](#-ai--ml-frameworks) — PyTorch, TensorFlow, and JAX on ROCm<br>
🚀 [Model Serving \& Inference](#-model-serving--inference) — vLLM, SGLang, TGI, and distributed inference<br>
🔄 [Workload Migration](#-workload-migration) — HIP, HIPIFY, and porting guides<br>
🛠️ [Community Projects \& Tools](#️-community-projects--tools) — Open-source tools with ROCm support<br>
⚡ [Performance, Benchmarking \& Optimization](#-performance-benchmarking--optimization) — Tuning guides and benchmarks<br>
📊 [Monitoring \& Observability](#-monitoring--observability) — AMD SMI, Prometheus, and Grafana<br>
🏛️ [Reference Architectures \& Use Cases](#️-reference-architectures--use-cases) — End-to-end deployment patterns<br>
📚 [Community \& Learning Resources](#-community--learning-resources) — Forums, docs portals, and examples<br>

-----

> Disclaimer: I am an employee at AMD, but this is a personal project. The views and resources shared here are my own and do not necessarily represent the official views or endorsements of AMD.

-----

## 🏗️ Core Infrastructure

### AMD Instinct GPU Hardware

- **[Product Portfolio Overview](https://www.amd.com/en/products/accelerators/instinct.html)** - Official AMD website for Instinct GPUs.
  - **[Wikipedia Overview](https://en.wikipedia.org/wiki/AMD_Instinct)** - Wikipedia's detailed breakdown of the AMD Instinct GPU family.
- **[CDNA 3 Whitepaper](https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-3-white-paper.pdf)** - Official whitepaper detailing the architecture of the MI300 series.
- **[CDNA 4 Whitepaper](https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/white-papers/amd-cdna-4-architecture-whitepaper.pdf)** - Official whitepaper on the CDNA 4 architecture.

### ROCm Software Stack

- **[What is ROCm?](https://rocm.docs.amd.com/en/latest/what-is-rocm.html)** - The official introduction to the ROCm software stack.
- **[ROCm Installation & Configuration](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/)** - Official guides for installing ROCm on Linux.
- **[Supported GPUs and OS Matrix](https://rocm.docs.amd.com/en/latest/compatibility/compatibility-matrix.html)** - The official compatibility matrix for ROCm versions, GPUs, and operating systems.
- **[ROCm Tools, Compilers, and Runtimes](https://rocm.docs.amd.com/en/develop/reference/rocm-tools.html)** - A reference guide to the complete suite of ROCm development tools.
- **[System Acceptance & Verification](https://instinct.docs.amd.com/projects/system-acceptance/en/latest/index.html)** - Procedures for verifying and testing a ROCm installation.
- **[ROCm on Radeon and Ryzen](https://rocm.docs.amd.com/projects/radeon-ryzen/en/latest/index.html)** - Official guide for using ROCm on consumer Radeon GPUs (RDNA 3 & 4) and Ryzen APUs, enabling local AI development and inference with PyTorch support on Linux and Windows.
- **[TheRock (The HIP Environment and ROCm Kit)](https://github.com/ROCm/TheRock)** - AMD's next-generation open-source build platform for HIP and ROCm, featuring nightly releases, a CMake super-project for cross-platform source builds, and comprehensive CI/CD pipelines; currently in early preview and designated as the future default ROCm build system.

### System Architecture & Networking

- **[GPU Architecture Overview](https://rocm.docs.amd.com/en/latest/conceptual/gpu-arch.html)** - A conceptual overview of AMD GPU architecture.
- **[GPU Isolation Techniques](https://rocm.docs.amd.com/en/latest/conceptual/gpu-isolation.html)** - Guide on how to isolate GPU resources for multi-tenant or containerized environments.
- **[Multi-Node/Cluster Networking](https://instinct.docs.amd.com/projects/gpu-cluster-networking/en/latest/how-to/multi-node-config.html)** - How-to guide for configuring networking in a multi-node GPU cluster.
- **[Cluster Reference Guide (MI300 Series)](https://www.amd.com/content/dam/amd/en/documents/instinct-tech-docs/other/instinct-mi300-series-cluster-reference-guide.pdf)** - A detailed reference for building and managing MI300-based clusters.

### Virtualization & Partitioning

- **[AMD GPU GIM Driver](https://github.com/amd/MxGPU-Virtualization)** - Linux kernel module for AMD SR-IOV based hardware virtualization. Supports KVM-based hypervisors with necessary kernel compatibility layer.
- **[GPU Virtualization Options](https://instinct.docs.amd.com/projects/virt-drv/en/latest/index.html)** - Official documentation for AMD's MxGPU virtualization drivers.
- **[SR-IOV Configuration Guide](https://instinct.docs.amd.com/projects/virt-drv/en/latest/userguides/Getting_started_with_MxGPU.html#understanding-sr-iov)** - Details on configuring Single Root I/O Virtualization.
- **[Compute/Memory Partitioning](https://rocm.blogs.amd.com/software-tools-optimization/compute-memory-modes/README.html)** - Blog post explaining the different compute and memory modes available on Instinct GPUs.
- **[dstack.ai: Benchmark AMD VMs](https://dstack.ai/blog/benchmark-amd-vms/)** - An independent benchmark comparing bare-metal vs. VM performance on AMD GPUs.
- **[dstack.ai: Benchmark AMD Containers and Partitions](https://dstack.ai/blog/benchmark-amd-containers-and-partitions/)** - A follow-up benchmark focusing on container and GPU partitioning performance.

-----

## 🐳 Container & Orchestration Hub

### Container Foundation

- **[AMD Infinity Hub](https://www.amd.com/en/developer/resources/infinity-hub.html)** - AMD's official container registry for ROCm-enabled applications.
- **[ROCm Docker Hub](https://hub.docker.com/u/rocm)** - The official ROCm organization on Docker Hub for base images.
- **[ROCm Container Ecosystem Blog](https://rocm.blogs.amd.com/software-tools-optimization/rocm-containers/README.html)** - An introductory blog post on building and using ROCm containers.
- **[AMD Container Toolkit](https://rocm.blogs.amd.com/software-tools-optimization/amd-container-toolkit/README.html)** - A tool to automatically configure containers to use AMD GPUs.

### Kubernetes Integration

- **[AMD GPU Operator for Kubernetes](https://instinct.docs.amd.com/projects/gpu-operator/en/latest/index.html)** - Official documentation for the operator that automates GPU management in a Kubernetes cluster.
- **[GPU Operator GitHub Repo](https://github.com/ROCm/gpu-operator)** - The source code and issue tracker for the AMD GPU Operator.
- **[Kubernetes GPU Partitioning](https://instinct.docs.amd.com/projects/gpu-operator/en/latest/dcm/applying-partition-profiles.html)** - Guide on how to apply GPU partitioning profiles within Kubernetes.
- **[K8s Inference Orchestration (Part 1)](https://rocm.blogs.amd.com/artificial-intelligence/k8s-orchestration-part1/README.html)** - A practical blog series on deploying LLM inference services on a MI300X cluster with Kubernetes.
- **[K8s Node Labeling](https://github.com/ROCm/k8s-device-plugin/blob/master/cmd/k8s-node-labeller/README.md)** - Tool to automatically label Kubernetes nodes with GPU properties for scheduling.

-----

## 🤖 AI / ML Frameworks

- **[PyTorch on ROCm Installation](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/3rd-party/pytorch-install.html)** - Official guide for installing the ROCm-enabled version of PyTorch.
- **[TensorFlow on ROCm Installation](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/3rd-party/tensorflow-install.html)** - Official guide for installing the ROCm-enabled version of TensorFlow.
- **[JAX on ROCm Installation](https://rocm.docs.amd.com/projects/install-on-linux/en/latest/install/3rd-party/jax-install.html)** - Official guide for getting JAX to work with ROCm.

-----

## 🚀 Model Serving & Inference

- **[vLLM on ROCm](https://rocm.docs.amd.com/en/latest/how-to/rocm-for-ai/inference/deploy-your-model.html#serving-using-vllm)** - Documentation for using the popular vLLM inference engine with ROCm.
- **[SGLang on AMD GPUs](https://docs.sglang.ai/platforms/amd_gpu.html)** - Documentation for SGLang, an open-source LLM inference engine, on AMD GPUs.
- **[Hugging Face TGI on ROCm](https://rocm.docs.amd.com/en/latest/how-to/rocm-for-ai/inference/deploy-your-model.html#serving-using-hugging-face-tgi)** - Guide for using Hugging Face's Text Generation Inference server.
- **[AITER (AI Tensor Engine)](https://rocm.blogs.amd.com/software-tools-optimization/aiter-ai-tensor-engine/README.html)** - AMD's inference runtime and tools for deploying models on Instinct GPUs.
- **[Distributed Inference with ROCm](https://rocm.blogs.amd.com/artificial-intelligence/llm-d-distributed/README.html)** - A blog post detailing how to set up and run distributed inference across multiple GPUs.

-----

## 🔄 Workload Migration

- **[HIP Programming Guide](https://rocm.docs.amd.com/projects/HIP/en/latest/what_is_hip.html)** - An introduction to HIP (Heterogeneous-compute Interface for Portability), AMD's C++ runtime API for creating portable GPU applications.
- **[HIPIFY Tools](https://rocm.docs.amd.com/projects/HIP/en/latest/how-to/hip_porting_guide.html)** - Official documentation for HIPIFY, a set of tools for automatically translating CUDA source code into HIP source code.
- **[SCIMUS: Porting CUDA to HIP](https://thescimus.com/blog/transitioning-from-cuda-to-rocm/)** - A clear, concise community blog post walking through the process of migrating an application from CUDA to HIP.

-----

## 🛠️ Community Projects & Tools

- **[tinygrad](https://github.com/tinygrad/tinygrad)** - Lightweight deep learning framework with first-class support for AMD GPUs.
- **[GitHub \#rocm Topic](https://github.com/topics/rocm)** - A collection of open-source projects on GitHub that use ROCm.

-----

## ⚡ Performance, Benchmarking & Optimization

- **[System Optimization Guide](https://rocm.docs.amd.com/en/latest/how-to/system-optimization/index.html)** - Official guide on tuning system-level settings (BIOS, OS) for optimal performance.
- **[vLLM Performance Optimization](https://rocm.blogs.amd.com/artificial-intelligence/LLM_Inference/README.html)** - A detailed blog from AMD on how to optimize LLM inference performance with vLLM.
- **[Tensor Parallelism on ROCm](https://rocm.blogs.amd.com/artificial-intelligence/tensor-parallelism/README.html)** - An explanation of tensor parallelism and how to implement it for large model training on ROCm.
- **[Model Quantization Techniques](https://rocm.docs.amd.com/en/latest/how-to/rocm-for-ai/inference-optimization/model-quantization.html)** - How-to guide on applying quantization to reduce model size and improve inference speed.
- **[Phoronix: ROCm](https://www.phoronix.com/search/ROCm)** - Independent performance benchmarks and articles covering ROCm from the Phoronix hardware site.
  
-----

## 📊 Monitoring & Observability

- **[AMD SMI (System Management Interface)](https://rocm.docs.amd.com/projects/amdsmi/en/latest/index.html)** - The command-line tool for monitoring and managing AMD GPUs.
- **[Prometheus Metrics Exporter](https://instinct.docs.amd.com/projects/device-metrics-exporter/en/latest/)** - An official exporter to expose GPU metrics to a Prometheus monitoring stack.
- **[Grafana Dashboard for AMD GPUs](https://grafana.com/grafana/dashboards/18913-amd-gpu-nodes/)** - A community-provided Grafana dashboard template for visualizing AMD GPU metrics.
- **[rocProfiler](https://rocm.docs.amd.com/projects/rocprofiler-systems/en/latest/index.html)** - A tool for profiling the performance of applications running on ROCm.
- **[Customer Acceptange Guide](https://instinct.docs.amd.com/projects/system-acceptance/en/latest/index.html)** - Structured, repeatable methodology for configuring, validating, benchmarking, and baselining AMD Instinct GPU platforms.

-----

## 🏛️ Reference Architectures & Use Cases

- **[AI Inference Load Balancing](https://instinct.docs.amd.com/projects/gpu-cluster-networking/en/latest/how-to/multi-node-inference-lb.html)** - A reference architecture for load balancing inference requests across a multi-node cluster.
- **[Multi-Model Serving Demo](https://github.com/AMD-melliott/ai-infra-summit)** - A GitHub repository demonstrating a multi-model serving architecture on ROCm.
- **[Instinct for Computer Vision](https://instinct.docs.amd.com/latest/vision/index.html)** - Documentation hub for computer vision applications.
- **[Instinct for Data Science](https://instinct.docs.amd.com/latest/data-science/index.html)** - Documentation hub for data science libraries and applications.
- **[Instinct for Life Science](https://instinct.docs.amd.com/latest/life-science/index.html)** - Documentation hub for life science and molecular dynamics applications.

-----

## 📚 Community & Learning Resources

- **[r/AMD_MI300 Subreddit](https://www.reddit.com/r/AMD_MI300/)** - Community discussion forum for AMD's MI3XX accelerators for high-performance computing, AI, and related topics.
- **[r/ROCm Subreddit](https://www.reddit.com/r/ROCm/)** - The main community hub on Reddit for questions, troubleshooting, and sharing ROCm projects.
- **[ROCm GitHub Discussions](https://github.com/ROCm/ROCm/discussions)** - The official GitHub discussion board for the ROCm project.
- **[ROCm AI Developer Hub](https://www.amd.com/en/developer/resources/rocm-hub/dev-ai.html)** - A centralized portal for AI developers using ROCm.
- **[ROCm GitHub Organization](https://github.com/rocm)** - The home of all official ROCm-related repositories.
- **[ROCm Code Examples](https://github.com/rocm/rocm-examples)** - A collection of sample code demonstrating various features of the ROCm platform.
- **[AMD Developer Cloud](https://www.amd.com/en/developer/resources/cloud-access/amd-developer-cloud.html)** - A program that provides free cloud access to AMD Instinct hardware for developers and researchers.
- **[Awesome LLM Apps](https://github.com/Shubhamsaboo/awesome-llm-apps)** - Collection of awesome LLM apps with AI Agents and RAG using OpenAI, Anthropic, Gemini and opensource models.
- **[Awesome AI/ML Resources](https://github.com/armankhondker/awesome-ai-ml-resources)** - Learn AI/ML for beginners with a roadmap and free resources.
- **[Awesome AI](https://github.com/openbestof/awesome-ai)** - A curated list of awesome AI tools, frameworks, api, software and resources.
- **[Awesome LLM](https://github.com/Hannibal046/Awesome-LLM)** - A collection of resources and papers related to large language models.
- **[Official ROCm Documentation](https://rocm.docs.amd.com)** - The official documentation portal for the ROCm software stack.
- **[Official Instinct Documentation](https://instinct.docs.amd.com)** - The official documentation portal for Instinct hardware and cluster management.
