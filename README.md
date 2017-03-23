# achievemore_cookbook

TODO: Enter the cookbook description here.

{
  "deploy": {
    "business_backbone": {
      "database": {
        "adapter": "mysql",
        "username": "achievemore",
        "host": "achievemore-bkp.cgdyuveillow.sa-east-1.rds.amazonaws.com",
        "database": "achievemore_qa",
        "password": ""
      },
      "framework": {
        "migrate": false,
        "assets_precompile": false
      },
      "appserver": {
        "adapter": "puma"
      },
      "webserver": {
        "build_type": "source"
      }
    }
  },
  "ruby-ng": {
    "ruby_version": "2.4"
  },
  "nginx": {
    "version": "1.11.11",
    "source": {
      "checksum": "5a7ac480248e28d26e68fd1ea3dbd8b05f69726d71528e79332839b171277262",
      "modules": [
        "chef_nginx::http_v2_module",
        "chef_nginx::http_realip_module",
        "chef_nginx::http_stub_status_module",
        "chef_nginx::ipv6",
        "chef_nginx::http_ssl_module",
        "chef_nginx::http_gzip_static_module"
      ]
    }
  }
}

# TO GET NGINX CHECKSUM
curl -L -s http://nginx.org/download/nginx-1.11.11.tar.gz | shasum -a 256