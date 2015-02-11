/**
 * writes the <prev 1 2 3 4 5 next> for paging across search results
 * 
 * @param the name of the form which contains the necessary paging information
 *        such as "total_items", "items_per_page", "current_page", "search_id"
 * @return - pager defined by the form.
 */
function writePageNav(formName) {
    var currentPage = document.forms[formName].elements["current_page"].value;
    var resultsPerPage = document.forms[formName].elements["results_per_page"].value;
    var totalResults = document.forms[formName].elements["total_results"].value;    
    var totalPages = totalResults/resultsPerPage;
    if ((totalPages % resultsPerPage) > 0) {
        var totalPagesString = totalPages.toString().split(".");
        totalPages = totalPagesString[0]/1 + 1;
    }

    var searchId = document.forms[formName].elements["search_id"].value;
    var searchResultsPage = document.forms[formName].elements["search_results_page"].value;
    var bufferSize = 5;

    var previousPage = "";
    if (currentPage != 1) {
        previousPage = "<a class=olink href='javascript:goToPageResults(\"" + formName + "\", " + 
                       (currentPage -1) + ");'>&lt;previous&gt;</a>&nbsp;";
    }
    var nextPage = "";
    if (currentPage != totalPages) {
        nextPage = "<a class=olink href='javascript:goToPageResults(\"" + formName + "\", " + 
                   (currentPage -1) + ");'>&lt;next&gt;</a>";
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
        leftPages += "<a class=olink href='javascript:goToPageResults(\"" + formName + "\", " + 
                     i + ");'>" + i + "</a>&nbsp;";
    }

    var rightPages = "";
    var endRight = totalPages;
    if (currentPage/1 + bufferSize/1 < totalPages) {
        alert("here: " + currentPage + " + " + bufferSize);
        endRight = currentPage/1 + bufferSize/1 + 1;
    }

    for (i = currentPage/1 + 1; i < endRight; i++) {
        rightPages += "<a class=olink href='javascript:goToPageResults(\"" + formName + "\", " + 
                      i + ");'>" + i + "</a>&nbsp;";
    }

    if (i <= totalPages) {
        rightPages += "<a class=olink href='javascript:goToPageResults(\"" + formName + "\", " + 
                      totalPages + ");'>" + totalPages + "</a>&nbsp;";
    }

    var currentPage = "<font class=content>" + currentPage + "</font>&nbsp;";

    document.write("<font class='content'>Pages: </font>" + previousPage + leftPages + currentPage + rightPages + nextPage);
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


function goToPageResults(formName, pageNumber) {
    document.forms[formName].elements["current_page"].value = pageNumber;
    document.forms[formName].action = document.forms[formName].elements["search_results_page"].value;
    document.forms[formName].submit();
}

