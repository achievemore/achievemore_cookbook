# achievemore_cookbook

TODO: Enter the cookbook description here.

# production conf
{
    "defaults": {
        "webserver": {
            "use_apache2_ppa": false
        }
    },
    "rbenv": {
        "user": "deploy",
        "group": "www-data"
    },
    "deploy": {
        "business_backbone": {
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemorev4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore",
                "password": "",
                "pool": 20
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
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
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemorev4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore",
                "password": "",
                "pool": 10
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": false
            },
            "appserver": {
                "adapter": "puma"
            },
            "webserver": {
                "build_type": "source",
                "extra_config_proxy": [
                    "# to work with websockets",
                    "proxy_http_version 1.1;",
                    "proxy_set_header Upgrade $http_upgrade;",
                    "proxy_set_header Connection \"upgrade\";"
                ],
                "extra_config_proxy_ssl": [
                    "# to work with websockets",
                    "proxy_http_version 1.1;",
                    "proxy_set_header Upgrade $http_upgrade;",
                    "proxy_set_header Connection \"upgrade\";"
                ]
            }
        },
        "frontend": {
            "global": {
                "environment": "production",
                "create_dirs_before_symlink": [
                    "../../shared/assets/fonts",
                    "../../shared/assets/icons"
                ]
            },
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemorev4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore",
                "password": "",
                "pool": 20
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
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
        "ruby_version": "2.5.1"
    },
    "nginx": {
        "version": "1.10.3",
        "worker_processes": 2,
        "worker_connections": 2048,
        "source": {
            "checksum": "75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90",
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

# prod new conf
{
    "defaults": {
        "framework": {
            "migrate": false,
            "assets_precompile": false
        },
        "webserver": {
            "use_apache2_ppa": false
        }
    },
    "rbenv": {
        "user": "deploy",
        "group": "www-data"
    },
    "deploy": {
        "business_backbone": {
            "rails_env": "production",
            "global": {
                "create_dirs_before_symlink": [
                    "../../shared/assets/fonts",
                    "../../shared/assets/icons"
                ],
                "logrotate_rotate": 10,
                "environment": "production"
            },
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemorev4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore",
                "password": "",
                "pool": 20
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
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
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemorev4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore",
                "password": "",
                "pool": 20
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": false
            },
            "appserver": {
                "adapter": "puma"
            },
            "webserver": {
                "build_type": "source",
                "enable_upgrade_method": true
            },
            "global": {
                "logrotate_rotate": 10,
                "environment": "production"
            }
        },
        "frontend": {
            "global": {
                "logrotate_rotate": 10,
                "environment": "production",
                "create_dirs_before_symlink": [
                    "../../shared/assets/fonts",
                    "../../shared/assets/icons"
                ]
            },
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemorev4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore",
                "password": "",
                "pool": 20
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
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
    "nginx": {
        "worker_processes": 2,
        "worker_connections": 2048,
        "source": {
            "modules": [
                "nginx::http_v2_module",
                "nginx::http_realip_module",
                "nginx::http_stub_status_module",
                "nginx::ipv6",
                "nginx::http_ssl_module",
                "nginx::http_gzip_static_module"
            ]
        }
    },
    "ruby-version": "2.5"
}

# TO GET NGINX CHECKSUM
curl -L -s http://nginx.org/download/nginx-1.11.11.tar.gz | shasum -a 256

# angular atual conf

{
    "defaults": {
        "webserver": {
            "use_apache2_ppa": false
        }
    },
    "rbenv": {
        "user": "deploy",
        "group": "www-data"
    },
    "deploy": {
        "business_backbone": {
            "global": {
                "environment": "qa"
            },
            "rails_env": "qa",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemore.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_qa",
                "password": "",
                "pool": 20
            },
            "framework": {
                "migrate": false,
                "assets_precompile": false
            },
            "appserver": {
                "adapter": "puma",
                "worker_processes": 2
            },
            "webserver": {
                "build_type": "source",
                "client_max_body_size": "1G"
            }
        },
        "websocket_api": {
            "global": {
                "environment": "qa"
            },
            "rails_env": "qa",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemore.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_qa",
                "password": "",
                "pool": 5
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": false
            },
            "appserver": {
                "adapter": "puma",
                "worker_processes": 2
            },
            "webserver": {
                "build_type": "source",
                "extra_config_proxy": [
                    "# to work with websockets",
                    "proxy_http_version 1.1;",
                    "proxy_set_header Upgrade $http_upgrade;",
                    "proxy_set_header Connection \"upgrade\";"
                ],
                "extra_config_proxy_ssl": [
                    "# to work with websockets",
                    "proxy_http_version 1.1;",
                    "proxy_set_header Upgrade $http_upgrade;",
                    "proxy_set_header Connection \"upgrade\";"
                ]
            }
        },
        "frontend": {
            "global": {
                "environment": "qa",
                "create_dirs_before_symlink": [
                    "../../shared/assets/fonts",
                    "../../shared/assets/icons"
                ]
            },
            "rails_env": "qa",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemore.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_qa",
                "password": "",
                "pool": 5
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": true
            },
            "appserver": {
                "adapter": "puma",
                "worker_processes": 2
            },
            "webserver": {
                "build_type": "source"
            }
        },
        "etl_admin": {
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore_etl",
                "host": "achievemore-etv4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_etl",
                "password": "AchieveMore2014",
                "pool": 5
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": true
            },
            "appserver": {
                "adapter": "puma",
                "worker_processes": 2
            },
            "webserver": {
                "build_type": "source"
            },
            "worker": {
                "adapter": "sidekiq",
                "process_count": 1,
                "syslog": true,
                "config": {
                    "concurrency": 5,
                    "production": {
                        "concurrency": 5
                    },
                    "queues": [
                        "default",
                        [
                            "high",
                            2
                        ]
                    ],
                    "dynamic": true,
                    "enabled": true
                }
            }
        }
    },
    "ruby-ng": {
        "ruby_version": "2.5.1"
    },
    "nginx": {
        "version": "1.10.3",
        "worker_processes": 2,
        "worker_connections": 1024,
        "source": {
            "checksum": "75020f1364cac459cb733c4e1caed2d00376e40ea05588fb8793076a4c69dd90",
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

# angular new conf
{
    "defaults": {
        "framework": {
            "migrate": false,
            "assets_precompile": false
        },
        "webserver": {
            "use_apache2_ppa": false
        }
    },
    "rbenv": {
        "user": "deploy",
        "group": "www-data"
    },
    "deploy": {
        "business_backbone": {
            "rails_env": "qa",
            "global": {
                "create_dirs_before_symlink": [
                    "../../shared/assets/fonts",
                    "../../shared/assets/icons"
                ],
                "logrotate_rotate": 10,
                "environment": "qa"
            },
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemore.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_qa",
                "password": "",
                "pool": 10
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
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
            "rails_env": "qa",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemore.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_qa",
                "password": "",
                "pool": 10
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": false
            },
            "appserver": {
                "adapter": "puma"
            },
            "webserver": {
                "build_type": "source",
                "enable_upgrade_method": true
            },
            "global": {
                "logrotate_rotate": 10,
                "environment": "qa"
            }
        },
        "frontend": {
            "global": {
                "logrotate_rotate": 10,
                "environment": "qa",
                "create_dirs_before_symlink": [
                    "../../shared/assets/fonts",
                    "../../shared/assets/icons"
                ]
            },
            "rails_env": "qa",
            "database": {
                "adapter": "mysql",
                "username": "achievemore",
                "host": "achievemore.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_qa",
                "password": "",
                "pool": 5
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": true
            },
            "appserver": {
                "adapter": "puma"
            },
            "webserver": {
                "build_type": "source"
            }
        },
        "etl_admin": {
            "rails_env": "production",
            "database": {
                "adapter": "mysql",
                "username": "achievemore_etl",
                "host": "achievemore-etv4.cgdyuveillow.sa-east-1.rds.amazonaws.com",
                "database": "achievemore_etl",
                "password": "AchieveMore2014",
                "pool": 5
            },
            "framework": {
                "migrate": false,
                "migration_command": "",
                "assets_precompile": true
            },
            "appserver": {
                "adapter": "puma",
                "worker_processes": 2
            },
            "webserver": {
                "build_type": "source"
            },
            "worker": {
                "adapter": "sidekiq",
                "process_count": 1,
                "syslog": true,
                "config": {
                    "concurrency": 5,
                    "production": {
                        "concurrency": 5
                    },
                    "queues": [
                        "default",
                        [
                            "high",
                            2
                        ]
                    ],
                    "dynamic": true,
                    "enabled": true
                }
            }
        }
    },
    "nginx": {
        "worker_processes": 2,
        "worker_connections": 2048,
        "source": {
            "modules": [
                "nginx::http_v2_module",
                "nginx::http_realip_module",
                "nginx::http_stub_status_module",
                "nginx::ipv6",
                "nginx::http_ssl_module",
                "nginx::http_gzip_static_module"
            ]
        }
    },
    "ruby-version": "2.5"
}
