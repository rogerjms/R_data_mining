library(RCurl)
library(XML)
movieScore <- function(x) {
    stopifnot(is.character(x))
    # 提交搜索豆瓣表单
    search <- getForm("http://movie.douban.com/subject_search", search_text = x)
    searchweb <- htmlParse(search)
    # 解析搜索结果页面
    resnodes <- getNodeSet(searchweb, "//div[@id='wrapper']//table[1]//a")
    if (is.null(resnodes)) 
        return(NULL) else resurl <- xmlGetAttr(resnodes[[1]], name = "href")
    # 得到影片页面后第二次解析
    resweb <- getURL(resurl, .encoding = "UTF-8")
    content <- htmlParse(resweb, encoding = "UTF-8")
    resnodes <- getNodeSet(content, "//div[@id='interest_sectl']//p[@class='rating_self clearfix']//strong")
    namenodes <- getNodeSet(content, "//div[@id='content']//h1//span")
    # 得到影片评分
    score <- xmlValue(resnodes[[1]])
    name <- xmlValue(namenodes[[1]])
    return(list(name = name, score = score))
}


search <- getForm("http://movie.douban.com/subject_search", search_text ="美国队长")
    searchweb <- htmlParse(search)
	searchweb
    # 解析搜索结果页面
    resnodes <- getNodeSet(searchweb, "//div[@id='wrapper']//table[1]//a")