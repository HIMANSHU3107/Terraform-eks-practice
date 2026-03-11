devops-eks-practice
│
├── terraform
│   ├── modules
│   │   ├── vpc
│   │   ├── eks
│   │   └── node-group
│   │
│   └── environments
│       └── dev
│           ├── main.tf
│           ├── variables.tf
│           └── outputs.tf
│
├── kubernetes
│   ├── manifests
│   └── ingress
│
├── helm
│   └── app-chart
│
├── microservices
│   ├── frontend
│   └── backend
│
├── monitoring
│
├── .github
│   └── workflows
│
└── docs