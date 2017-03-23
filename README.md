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
        "password": "AchieveMore123"
      },
      "framework": {
        "migrate": false,
        "assets_precompile": false
      },
      "appserver": {
        "adapter": "puma"
      },
      "webserver": {
        "build_type": "source",
        "client_max_body_size": "1G"
      }
    },
    "websocket_api": {
      "database": {
        "adapter": "mysql",
        "username": "achievemore",
        "host": "achievemore-bkp.cgdyuveillow.sa-east-1.rds.amazonaws.com",
        "database": "achievemore_qa",
        "password": "AchieveMore123"
      },
      "framework": {
        "migrate": false,
        "assets_precompile": false
      },
      "appserver": {
        "adapter": "puma"
      },
      "webserver": {
        "build_type": "source",
        "extra_proxy_config_ssl": [
          "# to work with websockets",
          "proxy_http_version 1.1;",
          "proxy_set_header Upgrade $http_upgrade;",
          "proxy_set_header Connection \"upgrade\";"
        ]
      }
    },
    "frontend": {
      "database": {
        "adapter": "mysql",
        "username": "achievemore",
        "host": "achievemore-bkp.cgdyuveillow.sa-east-1.rds.amazonaws.com",
        "database": "achievemore_qa",
        "password": "AchieveMore123"
      },
      "framework": {
        "migrate": false,
        "assets_precompile": true
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
    "worker_processes": 2,
    "worker_connections": 2048,
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