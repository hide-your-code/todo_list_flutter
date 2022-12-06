package com.example.todo_list

import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
  override fun onPostResume() {
    super.onPostResume()
    WindowCompat.setDecorFitsSystemWindows(window, false)
  }
}
