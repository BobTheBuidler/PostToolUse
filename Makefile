hooks:
	mkdir -p .clinerules/hooks/submodules
	# TaskStart hook update
	if [ ! -d .clinerules/hooks/submodules/TaskStart ]; then \
		git submodule add https://github.com/BobTheBuidler/TaskStart.git .clinerules/hooks/submodules/TaskStart || true; \
		git add .gitmodules .clinerules/hooks/submodules/TaskStart; \
	fi
	git submodule update --init --recursive
	git -c protocol.file.allow=always submodule update --remote .clinerules/hooks/submodules/TaskStart
	cp .clinerules/hooks/submodules/TaskStart/TaskStart .clinerules/hooks/TaskStart
	git add .clinerules/hooks/submodules/TaskStart
	git add .clinerules/hooks/TaskStart
	if ! git diff --cached --quiet; then \
		git commit -m "Update TaskStart hook submodule and file"; \
	fi
