Your project is configured with Android NDK 26.1.10909125, but the following plugin(s) depend on a different Android NDK version:
- jni requires Android NDK 28.2.13676358
- jni_flutter requires Android NDK 27.0.12077973
- share_plus requires Android NDK 27.0.12077973
- shared_preferences_android requires Android NDK 27.0.12077973
- url_launcher_android requires Android NDK 27.0.12077973
Fix this issue by using the highest Android NDK version (they are backward compatible).
Add the following to /media/islamux/Variety/Flutter_Projects/salam/android/app/build.gradle:

    android {
        ndkVersion = "28.2.13676358"
        ...
    }
Font asset "MaterialIcons-Regular.otf" was tree-shaken, reducing it from 1645184 to 2696 bytes (99.8% reduction). Tree-shaking can be disabled by providing the --no-tree-shake-icons flag when building your app.

FAILURE: Build failed with an exception.

* What went wrong:
Execution failed for task ':app:checkReleaseAarMetadata'.
> A failure occurred while executing com.android.build.gradle.internal.tasks.CheckAarMetadataWorkAction
   > 3 issues were found when checking AAR metadata:

       1.  Dependency 'androidx.browser:browser:1.9.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.0.

       2.  Dependency 'androidx.core:core-ktx:1.17.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.0.

       3.  Dependency 'androidx.core:core:1.17.0' requires Android Gradle plugin 8.9.1 or higher.

           This build currently uses Android Gradle plugin 8.7.0.

* Try:
> Run with --stacktrace option to get the stack trace.
> Run with --info or --debug option to get more log output.
> Run with --scan to get full insights.
> Get more help at https://help.gradle.org.

BUILD FAILED in 36m 20s
Running Gradle task 'assembleRelease'...                         2180.6s
Gradle task assembleRelease failed with exit code 1

