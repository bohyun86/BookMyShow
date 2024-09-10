package com.itwillbs.common;


public class MySQLCleanup {

    public void cleanup() {
        com.mysql.cj.jdbc.AbandonedConnectionCleanupThread.checkedShutdown();
    }
}
