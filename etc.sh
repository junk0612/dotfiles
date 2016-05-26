#!/bin/zsh

function mkcd () {
  mkdir $1 && cd $_
}

function daily_report () {
  original_dir=`pwd`
  today=`date "+%Y/%m/%d"`
  report_path="/Users/ENIXER/esa/daily_report/${today}"
  mkdir -p $report_path
  cd $report_path
  echo "日報 ${today}\n===\n" > text.md
  echo "やったこと\n---\n" >> text.md
  echo "考えたこと\n---\n" >> text.md
  echo "気分\n---\n" >> text.md
  echo "明日やること\n---\n" >> text.md
  vim text.md
  cd $original_dir
}
