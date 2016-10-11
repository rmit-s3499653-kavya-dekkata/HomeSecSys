getUrl = window.location;

BASE_URL = getUrl.protocol + "//" + getUrl.host + "/" + getUrl.pathname.split('/')[1];
USER_DASHBOARD=BASE_URL + "/services/dashBoard";
SERVICE_ALERTS=BASE_URL + "/services/alerts";
HISTORY_PAGINATION_TABLE=BASE_URL + "/services/historyPagination";
