package dev.vasconcelos.flutter_infrared

import android.content.Context
import android.hardware.ConsumerIrManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class FlutterInfraredPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var irManager: ConsumerIrManager? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_infrared")
        channel.setMethodCallHandler(this)
        irManager =
            flutterPluginBinding.applicationContext.getSystemService(Context.CONSUMER_IR_SERVICE) as? ConsumerIrManager
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "sendIrCommand") {
            val frequency = call.argument<Int>("frequency")
            val pattern = call.argument<List<Int>>("pattern")

            if (frequency != null && pattern != null) {
                if (irManager?.hasIrEmitter()!!) {
                    result.error("PERMISSION_DENIED", "Requires TRANSMIT_IR permission.", null)
                } else {
                    sendIrCommand(frequency, pattern, result)
                }
            } else {
                result.error("INVALID_ARGUMENTS", "Invalid or missing arguments.", null)
            }
        } else {
            result.notImplemented()
        }
    }


    private fun sendIrCommand(frequency: Int, pattern: List<Int>, result: Result) {
        try {
            irManager?.transmit(frequency, pattern.toIntArray())
            result.success(null)
        } catch (e: UnsupportedOperationException) {
            result.error("UNSUPPORTED_OPERATION", "IR emitter not available", null)
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
