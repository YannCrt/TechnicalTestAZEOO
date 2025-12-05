package com.userprofileapp

import android.content.Intent
import android.os.Bundle
import com.facebook.react.ReactActivity
import com.facebook.react.ReactActivityDelegate
import com.facebook.react.defaults.DefaultNewArchitectureEntryPoint.fabricEnabled
import com.facebook.react.defaults.DefaultReactActivityDelegate

class MainActivity : ReactActivity() {

  override fun getMainComponentName(): String = "UserProfileApp"

  override fun createReactActivityDelegate(): ReactActivityDelegate =
      DefaultReactActivityDelegate(this, mainComponentName, fabricEnabled)

  // ✅ AJOUTE CETTE MÉTHODE
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    
    // Lance directement Flutter au démarrage
    val intent = Intent(this, FlutterLauncherActivity::class.java)
    startActivity(intent)
    
    // Optionnel : Ferme MainActivity pour éviter de revenir en arrière
    finish()
  }
}