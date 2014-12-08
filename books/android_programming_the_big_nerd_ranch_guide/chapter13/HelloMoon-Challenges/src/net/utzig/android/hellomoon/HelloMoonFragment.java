package net.utzig.android.hellomoon;
import net.utzig.android.hellomoon.R;
import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;

public class HelloMoonFragment extends Fragment {
	
	private Button mPlayButton;
	private Button mStopButton;
	private AudioPlayer mPlayer = new AudioPlayer();
	
	@Override
	public View onCreateView(LayoutInflater inflater, ViewGroup parent,
			Bundle savedInstance) {
		
		View v = inflater.inflate(R.layout.fragment_hello_moon, parent, false);
		
		mPlayButton = (Button)v.findViewById(R.id.hellomoon_playButton);
		mPlayButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				if (mPlayer.isPaused() == true) {
					mPlayer.play(getActivity());
					mPlayButton.setText(R.string.hellomoon_pause);
				} else {
					mPlayer.pause();
					mPlayButton.setText(R.string.hellomoon_play);
				}
			}
		});
		
		mStopButton = (Button)v.findViewById(R.id.hellomoon_stopButton);
		mStopButton.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				mPlayer.stop();
				mPlayButton.setText(R.string.hellomoon_play);
			}
		});
		
		return v;
	}
	
	@Override
	public void onDestroy() {
		super.onDestroy();
		mPlayer.stop();
	}
}
