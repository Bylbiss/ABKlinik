/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.thread;

import javax.swing.SwingWorker;
import java.util.List;
import java.util.function.Consumer;

public class ChatRefreshThread extends SwingWorker<List<?>, Void> {
    private final RefreshTask task;
    private final Consumer<List<?>> onRefresh;
    private final Consumer<Exception> onError;
    
    public ChatRefreshThread(RefreshTask task, Consumer<List<?>> onRefresh, Consumer<Exception> onError) {
        this.task = task; this.onRefresh = onRefresh; this.onError = onError;
    }
    
    @Override
    protected List<?> doInBackground() throws Exception {
        return task.refresh();
    }
    
    @Override
    protected void done() {
        try {
            List<?> result = get();
            if (onRefresh != null) onRefresh.accept(result);
        } catch (Exception e) {
            if (onError != null) onError.accept(e);
        }
    }
    
    public interface RefreshTask { List<?> refresh() throws Exception; }
}