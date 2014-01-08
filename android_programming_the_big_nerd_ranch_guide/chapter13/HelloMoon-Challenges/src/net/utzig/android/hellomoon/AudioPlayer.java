package net.utzig.android.hellomoon;

import net.utzig.android.hellomoon.R;
import android.content.Context;
import android.media.MediaPlayer;


public class AudioPlayer {
	
	private MediaPlayer mPlayer;
	private boolean mPaused = true;
	
	public void stop() {
		if (mPlayer != null) {
			mPlayer.release();
			mPlayer = null;
			mPaused = true;
		}
	}
	
	public void play(Context c) {
		if (mPlayer == null) {
			mPlayer = MediaPlayer.create(c, R.raw.one_small_step);
			mPlayer.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
				@Override
				public void onCompletion(MediaPlayer mp) {
					stop();
				}
			});
			mPlayer.start();
			mPaused = false;
		}
		
		if (mPaused == true) {
			mPlayer.start();
			mPaused = false;
		}
	}
	
	public void pause() {
		if (mPaused == false) {
			mPlayer.pause();
			mPaused = true;
		}
	}
	
	public boolean isPaused() {
		return mPaused;
	}

}
