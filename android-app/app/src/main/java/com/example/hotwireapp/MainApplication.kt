package com.example.hotwireapp

import android.app.Application
import dev.hotwire.core.BuildConfig
import dev.hotwire.core.config.Hotwire
import dev.hotwire.core.turbo.config.PathConfiguration

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        
        // Configure Hotwire with your Rails app URL
        Hotwire.configure(
            appUrl = "https://your-rails-app.com", // Replace with your Rails app URL
            userAgent = "HotwireApp Android ${BuildConfig.VERSION_NAME}"
        )
        
        // Optional: Configure path configurations for native screens
        // Hotwire.loadPathConfiguration(
        //     context = this,
        //     location = PathConfiguration.Location(
        //         assetFilePath = "json/path_configuration.json"
        //     )
        // )
    }
}