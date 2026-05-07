/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.thread;

import javax.swing.SwingWorker;
import java.io.File;
import java.util.function.Consumer;

public class ReportGenerationThread extends SwingWorker<File, Void> {
    private final ReportTask task;
    private final Consumer<File> onSuccess;
    private final Consumer<Exception> onError;
    
    public ReportGenerationThread(ReportTask task, Consumer<File> onSuccess, Consumer<Exception> onError) {
        this.task = task; this.onSuccess = onSuccess; this.onError = onError;
    }
    
    @Override
    protected File doInBackground() throws Exception {
        return task.generate();
    }
    
    @Override
    protected void done() {
        try {
            File file = get();
            if (onSuccess != null) onSuccess.accept(file);
        } catch (Exception e) {
            if (onError != null) onError.accept(e);
        }
    }
    
    public interface ReportTask { File generate() throws Exception; }
}