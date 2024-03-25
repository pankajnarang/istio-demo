resource "kubernetes_namespace" "istio" {
  metadata {
    #name of the namespace
    name = "istio-system"
  }
}

resource "kubernetes_namespace" "istio-ingress" {
  metadata {
    #name of the namespace
    name = "istio-ingress"
  }
}

resource "helm_release" "istio-base" {
  name       = "istio-base"                                          # release name to be installed in cluster
  repository = "https://istio-release.storage.googleapis.com/charts" # helm charts repository
  chart      = "base"                                                # helm chart name
  depends_on = [kubernetes_namespace.istio]
  namespace  = kubernetes_namespace.istio.metadata[0].name # namespace where this helm release will be installed into
  set {
    name  = "args"
    value = "--defaultRevision=default"
  }
  wait = true # Wait for the release to be deployed
}

resource "helm_release" "istiod" {
  name       = "istiod"                                              # release name to be installed in cluster
  repository = "https://istio-release.storage.googleapis.com/charts" # helm charts repository
  chart      = "istiod"                                              # helm chart name
  depends_on = [kubernetes_namespace.istio]
  namespace  = kubernetes_namespace.istio.metadata[0].name # namespace where this helm release will be installed into
  wait       = true                                        # Wait for the release to be deployed
}

resource "helm_release" "istio-ingress" {
  name       = "istio-ingress"                                       # release name to be installed in cluster
  repository = "https://istio-release.storage.googleapis.com/charts" # helm charts repository
  chart      = "gateway"                                             # helm chart name
  depends_on = [kubernetes_namespace.istio-ingress]
  namespace  = kubernetes_namespace.istio-ingress.metadata[0].name # namespace where this helm release will be installed into
  wait       = true                                                # Wait for the release to be deployed
}