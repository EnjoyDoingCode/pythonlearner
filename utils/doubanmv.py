#!/usr/bin/env python2
# coding:utf-8
import requests
from lxml import etree

# 发起http请求 豆瓣top250电影榜
for i in range(0, 10):
    # print '第%d页:' % (i + 1);
    #找出豆瓣url的规律,末尾start=一个数字
    targeturl = 'https://movie.douban.com/top250?start=' + str(i * 25);
    r = requests.get(targeturl)
    # 使用xpath分析   参考网站:  http://www.cnblogs.com/giserliu/p/4399778.html
    tree = etree.HTML(r.content)
    nodes = tree.xpath("//*[@id='content']/div/div[1]/ol/li/div/div[2]/div[1]/a/span[1]")
    for n in nodes:
        moviename = n.text
        print moviename
        print '\n'
