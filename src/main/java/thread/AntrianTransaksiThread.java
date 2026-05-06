/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package main.java.thread;

import javax.swing.SwingWorker;
import java.util.function.Consumer;

public class AntrianTransaksiThread extends SwingWorker<Void, String> {
    private final Consumer<String> onUpdate;
    private final Runnable onDone;
    private volatile boolean running = true;
    
    public AntrianTransaksiThread(Consumer<String> onUpdate, Runnable onDone) {
        this.onUpdate = onUpdate; this.onDone = onDone;
    }
    
    @Override
    protected Void doInBackground() throws Exception {
        while (running && !isCancelled()) {
            // simulasi ambil antrian
            publish("Memeriksa antrian...");
            Thread.sleep(5000);
        }
        return null;
    }
    
    @Override
    protected void process(java.util.List<String> chunks) {
        if (onUpdate != null) chunks.forEach(onUpdate);
    }
    
    @Override
    protected void done() {
        if (onDone != null) onDone.run();
    }
    
    public void stop() { running = false; cancel(true); }
}