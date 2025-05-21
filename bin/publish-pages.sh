#! /bin/bash
npm run lint
npm run build
git subtree push --prefix dist origin gh-pages
