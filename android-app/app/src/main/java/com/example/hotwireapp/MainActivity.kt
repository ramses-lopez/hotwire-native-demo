package com.example.hotwireapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import dev.hotwire.navigation.activities.HotwireActivity
import dev.hotwire.navigation.navigator.NavigatorConfiguration

class MainActivity : HotwireActivity() {
    
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
    
    override fun navigatorConfigurations() = listOf(
        NavigatorConfiguration(
            name = "main",
            startLocation = "https://your-rails-app.com", // Replace with your Rails app URL
            navigatorHostId = R.id.main_navigator_host
        )
    )
}