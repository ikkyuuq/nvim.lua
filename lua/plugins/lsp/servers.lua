return {
	jsonls = {
		settings = {
			json = {
				schemas = require("schemastore").json.schemas(),
				validate = { enable = true },
				format = { enable = true },
			},
		},
	},
	lua_ls = {
		settings = {
			Lua = {
				runtime = {
					version = "LuaJIT",
					path = vim.split(package.path, ";"),
				},
				diagnostics = {
					globals = { "vim" }, -- Recognize vim global
					disable = { "missing-parameter" }, -- Disable annoying missing parameter warning
				},
				workspace = {
					checkThirdParty = false,
					library = {
						"${3rd}/luv/library",
						unpack(vim.api.nvim_get_runtime_file("", true)),
					},
					maxPreload = 2000,
					preloadFileSize = 1000,
				},
				completion = {
					callSnippet = "Replace",
					keywordSnippet = "Replace",
					displayContext = 2,
				},
				telemetry = { enable = false },
			},
		},
	},
	bashls = {
		filetypes = { "sh", "bash", "zsh" },
		settings = {
			bashIde = {
				globPattern = "*@(.sh|.inc|.bash|.command)",
			},
		},
	},
	vimls = {
		filetypes = { "vim" },
		init_options = {
			diagnostic = { enable = true },
			indexes = {
				count = 3,
				gap = 100,
				projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
				runtimepath = true,
			},
			suggest = { fromVimruntime = true, fromRuntimepath = true },
		},
	},
	ts_ls = {
		filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
		cmd = { "typescript-language-server", "--stdio" },
		settings = {
			typescript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
				suggest = {
					completeFunctionCalls = true,
				},
			},
			javascript = {
				inlayHints = {
					includeInlayParameterNameHints = "all",
					includeInlayParameterNameHintsWhenArgumentMatchesName = false,
					includeInlayFunctionParameterTypeHints = true,
					includeInlayVariableTypeHints = true,
					includeInlayPropertyDeclarationTypeHints = true,
					includeInlayFunctionLikeReturnTypeHints = true,
					includeInlayEnumMemberValueHints = true,
				},
				suggest = {
					completeFunctionCalls = true,
				},
			},
		},
	},
	tailwindcss = {
		filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact" },
		init_options = {
			userLanguages = {
				eelixir = "html-eex",
				eruby = "erb",
			},
		},
	},
	emmet_language_server = {
		filetypes = {
			"css",
			"eruby",
			"html",
			"javascript",
			"javascriptreact",
			"less",
			"sass",
			"scss",
			"svelte",
			"pug",
			"typescriptreact",
			"vue",
		},
	},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
				gofumpt = true,
				usePlaceholders = true,
				hints = {
					assignVariableTypes = true,
					compositeLiteralFields = true,
					compositeLiteralTypes = true,
					constantValues = true,
					functionTypeParameters = true,
					parameterNames = true,
					rangeVariableTypes = true,
				},
			},
		},
	},
	pyright = {
		settings = {
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
					diagnosticMode = "workspace",
					typeCheckingMode = "basic",
				},
			},
		},
	},
	yamlls = {
		cmd = { "yaml-language-server", "--stdio" },
		filetypes = { "yaml", "yaml.docker-compose" },
		settings = {
			yaml = {
				schemas = {
					["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
					["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "docker-compose*.yml",
				},
				validate = true,
				format = {
					enable = true,
					singleQuote = true,
					bracketSpacing = true,
				},
			},
		},
	},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--completion-style=detailed",
			"--function-arg-placeholders",
			"--fallback-style=llvm",
		},
		init_options = {
			clangdFileStatus = true,
			usePlaceholders = true,
			completeUnimported = true,
			semanticHighlighting = true,
		},
	},
	marksman = {
		filetypes = { "markdown", "markdown.mdx" },
		settings = {
			markdown = {
				format = true,
				command = {
					formatCommand = "prettier --stdin-filepath ${INPUT}",
					formatStdin = true,
				},
			},
		},
	},
	intelephense = {
		filetypes = { "php" },
		settings = {
			intelephense = {
				stubs = {
					"apache",
					"bcmath",
					"bz2",
					"calendar",
					"com_dotnet",
					"Core",
					"curl",
					"date",
					"dba",
					"dom",
					"enchant",
					"fileinfo",
					"filter",
					"fpm",
					"ftp",
					"gd",
					"gettext",
					"gmp",
					"hash",
					"iconv",
					"itest",
					"intl",
					"json",
					"ldap",
					"libxml",
					"mbstring",
					"mcrypt",
					"meta",
					"mysqli",
					"oci8",
					"odbc",
					"openssl",
					"pcntl",
					"pcre",
					"PDO",
					"pdo_mysql",
					"pdo_pgsql",
					"pdo_sqlite",
					"pgsql",
					"Phar",
					"posix",
					"pspell",
					"readline",
					"recode",
					"Reflection",
					"regex",
					"session",
					"shmop",
					"SimpleXML",
					"snmp",
					"soap",
					"sockets",
					"sodium",
					"SPL",
					"sqlite3",
					"standard",
					"superglobals",
					"sysvmsg",
					"sysvsem",
					"sysvshm",
					"tidy",
					"tokenizer",
					"xml",
					"xmlreader",
					"xmlrpc",
					"xmlwriter",
					"xsl",
					"Zend OPcache",
					"zip",
					"zlib",
				},
				files = {
					maxSize = 5000000,
				},
				environment = {
					phpVersion = "8.4",
				},
				completion = {
					insertUseDeclaration = true,
					fullyQualifyGlobalConstantsAndFunctions = true,
					triggerParameterHints = true,
					maxItems = 100,
				},
				format = {
					enable = true,
				},
				diagnostics = {
					enable = true,
					run = "onType",
				},
				telemetry = {
					enable = false,
				},
			},
		},
		init_options = {
			storagePath = "/tmp/intelephense",
			licenceKey = nil, -- Add your license key if you have one
			clearCache = false,
		},
	},
}
