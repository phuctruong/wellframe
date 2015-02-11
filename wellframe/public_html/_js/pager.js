/**
 * writes the <prev 1 2 3 4 5 next> for paging across search results
 * 
 * @param the name of the form which contains the necessary paging information
 *        such as "total_items", "items_per_page", "current_page", "search_id"
 * @return - pager defined by the form.
 */
function writePageNav(formName, pageAnchor) {
    var currentPage = document.forms[formName].elements["current_page"].value;
    var resultsPerPage = document.forms[formName].elements["results_per_page"].value;
    var totalResults = document.forms[formName].elements["total_results"].value;    
    var totalPages = parseInt(totalResults/resultsPerPage);
    if ((totalPages * resultsPerPage) < totalResults) {
       totalPages++;
    }


    var searchId = document.forms[formName].elements["search_id"].value;
    var searchResultsPage = document.forms[formName].elements["search_results_page"].value;
    var bufferSize = 5;

    var previousPage = "";
    var previousPageNumber = currentPage/1 - 1;
    if (currentPage > 1) {
        previousPage = "<a class=pager_link href='javascript:goToPageResults(\"" + formName + "\", " + 
                       previousPageNumber;
        if (pageAnchor != null) {
           previousPage += ", \"" + pageAnchor + "\"";
        }
        previousPage += ");'>&lt;previous&gt;</a>&nbsp;";
    }
    var nextPage = "";
    var nextPageNumber = currentPage/1 + 1;
    if (nextPageNumber <= totalPages) {
        nextPage = "<a class=pager_link href='javascript:goToPageResults(\"" + formName + "\", " + 
                   nextPageNumber;
        if (pageAnchor != null) {
           nextPage += ", \"" + pageAnchor + "\"";
        }
        nextPage += ");'>&lt;next&gt;</a>";
    }


    var leftPages = "";  
    var startLeft = 1;
    if (currentPage > bufferSize) {
        startLeft = currentPage - bufferSize;
    } else {
        bufferSize = bufferSize/1 + (bufferSize/1 - currentPage/1) + 1;
    }
    var i;
    for (i = startLeft; i < currentPage; i++) {
        leftPages += "<a class=pager_link href='javascript:goToPageResults(\"" + formName + "\", " + 
                     i;
        if (pageAnchor != null) {
           leftPages += ", \"" + pageAnchor + "\"";
        }
        leftPages += ");'>" + i + "</a>&nbsp;";
    }

    var rightPages = "";
    var endRight = totalPages;
    if (currentPage/1 + bufferSize/1 < totalPages) {
        endRight = currentPage/1 + bufferSize/1 + 1;
    }

    for (i = currentPage/1 + 1; i < endRight; i++) {
        rightPages += "<a class=pager_link href='javascript:goToPageResults(\"" + formName + "\", " + 
                      i;
        if (pageAnchor != null) {
           rightPages += ", \"" + pageAnchor + "\"";
        }
        rightPages += ");'>" + i + "</a>&nbsp;";
    }

    if (i <= totalPages) {
        rightPages += "<a class=pager_link href='javascript:goToPageResults(\"" + formName + "\", " + 
                      totalPages;
        if (pageAnchor != null) {
           rightPages += ", \"" + pageAnchor + "\"";
        }
        rightPages += ");'>" + totalPages + "</a>&nbsp;";
    }

    var currentPage = "<font class='pager_currentPage'>" + currentPage + "</font>&nbsp;";

    document.write("<font class='pager_pages'>Pages: </font>" + previousPage + leftPages + currentPage + rightPages + nextPage);
}

function writeSearchResultsSummary(formName) {

    var currentPage = document.forms[formName].elements["current_page"].value;
    var resultsPerPage = document.forms[formName].elements["results_per_page"].value;
    var totalResults = document.forms[formName].elements["total_results"].value;
    var totalPages = ((totalResults + resultsPerPage)/resultsPerPage);

    var firstResultIndex = (currentPage - 1) * resultsPerPage;
    firstResultIndex = firstResultIndex/1 + 1;
    if (currentPage == 0 && totalResults == 0) {
        firstResultsIndex = 0;
    }

    var lastResultIndex = currentPage * resultsPerPage;
    if (lastResultIndex > totalResults) {
        lastResultIndex = totalResults;
    }

    document.write("Found " + totalResults + " results.  Displaying " + firstResultIndex + " - " + lastResultIndex + ".");
}


function goToPageResults(formName, pageNumber, pageAnchor) {
    document.forms[formName].elements["current_page"].value = pageNumber;
    var searchResultsPage = document.forms[formName].elements["search_results_page"].value;
    if (pageAnchor != null) {
       searchResultsPage += "#" + pageAnchor;
    }
    document.forms[formName].action = searchResultsPage;
    document.forms[formName].submit();
}

