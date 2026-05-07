/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.thread;

import javax.swing.SwingWorker;
import java.util.function.Consumer;

public class DatabaseTaskThread<T> extends SwingWorker<T, Void> {
    private final DatabaseTask<T> task;
    private final Consumer<T> onSuccess;
    private final Consumer<Exception> onError;

    public DatabaseTaskThread(DatabaseTask<T> task, Consumer<T> onSuccess, Consumer<Exception> onError) {
        this.task = task;
        this.onSuccess = onSuccess;
        this.onError = onError;
    }

    @Override
    protected T doInBackground() throws Exception {
        return task.execute();
    }

    @Override
    protected void done() {
        try {
            T result = get();
            if (onSuccess != null) onSuccess.accept(result);
        } catch (Exception e) {
            if (onError != null) onError.accept(e);
        }
    }

    public interface DatabaseTask<T> {
        T execute() throws Exception;
    }
}