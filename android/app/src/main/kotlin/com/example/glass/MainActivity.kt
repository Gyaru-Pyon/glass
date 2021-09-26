package com.example.glass
import android.os.Handler
import android.os.Bundle
import android.view.MotionEvent
import android.view.GestureDetector
import android.view.GestureDetector.OnDoubleTapListener
import io.flutter.Log
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity(), GestureDetector.OnGestureListener, OnDoubleTapListener {
    private var mDetector: GestureDetector? = null
    public override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        mDetector = GestureDetector(this, this)
        mDetector!!.setOnDoubleTapListener(this)
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        return if (mDetector!!.onTouchEvent(event)) {
            true
        } else super.onTouchEvent(event)
    }

    override fun onDown(event: MotionEvent): Boolean {
        Log.d(DEBUG_TAG, "onDown: $event")
        return true
    }

    override fun onFling(event1: MotionEvent, event2: MotionEvent,
                         velocityX: Float, velocityY: Float): Boolean {
        Log.d(DEBUG_TAG, "onFling: $event1$event2")
        return true
    }

    override fun onLongPress(event: MotionEvent) {
        Log.d(DEBUG_TAG, "onLongPress: $event")
    }

    override fun onScroll(event1: MotionEvent, event2: MotionEvent, distanceX: Float,
                          distanceY: Float): Boolean {
        Log.d(DEBUG_TAG, "onScroll: $event1$event2")
        return true
    }

    override fun onShowPress(event: MotionEvent) {
        Log.d(DEBUG_TAG, "onShowPress: $event")
    }

    override fun onSingleTapUp(event: MotionEvent): Boolean {
        Log.d(DEBUG_TAG, "onSingleTapUp: $event")
        return true
    }

    override fun onDoubleTap(event: MotionEvent): Boolean {
        Log.d(DEBUG_TAG, "onDoubleTap: $event")
        return true
    }

    override fun onDoubleTapEvent(event: MotionEvent): Boolean {
        Log.d(DEBUG_TAG, "onDoubleTapEvent: $event")
        return true
    }

    override fun onSingleTapConfirmed(event: MotionEvent): Boolean {
        Log.d(DEBUG_TAG, "onSingleTapConfirmed: $event")
        return true
    }

    companion object {
        private const val DEBUG_TAG = "Gestures"
    }
}