package net.utzig.android.geoquiz;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class CheatActivity extends Activity {

	public static final String EXTRA_ANSWER_IS_TRUE =
			"net.utzig.android.geoquiz.answer_is_true";
	public static final String EXTRA_ANSWER_SHOWN =
			"net.utzig.android.geoquiz.answer_shown";
	public static final String EXTRA_IS_CHEATER =
			"net.utzig.android.geoquiz.is_cheater";
	private static final String KEY_CHEATED = "cheated";
	
	private boolean mAnswerIsTrue;
	private boolean mAnswerWasShown;
	private TextView mAnswerTextView;
	private Button mShowAnswer;
	
	private void setAnswerShownResult(boolean isAnswerShown) {
		Intent data = new Intent();
		data.putExtra(EXTRA_ANSWER_SHOWN, isAnswerShown);
		setResult(RESULT_OK, data);
	}
	
	private void updateAnswerTextView(boolean newValue) {
		if (newValue) {
			mAnswerTextView.setText(R.string.true_button);
		} else {
			mAnswerTextView.setText(R.string.false_button);
		}
	}
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_cheat);
		
		mAnswerIsTrue = getIntent().getBooleanExtra(EXTRA_ANSWER_IS_TRUE, false);
		mAnswerWasShown = getIntent().getBooleanExtra(EXTRA_IS_CHEATER, false);
		
		mAnswerTextView = (TextView)findViewById(R.id.answerTextView);
		
    	setAnswerShownResult(mAnswerWasShown);
    	if (mAnswerWasShown) {
    		updateAnswerTextView(mAnswerIsTrue);
    	} else if (savedInstanceState != null) {
        	mAnswerWasShown = savedInstanceState.getBoolean(KEY_CHEATED, false);
        	setAnswerShownResult(mAnswerWasShown);
        	if (mAnswerWasShown) {
        		updateAnswerTextView(mAnswerIsTrue);
        	}
        } else {
        	setAnswerShownResult(false);
        }
		
		mShowAnswer = (Button)findViewById(R.id.showAnswerButton);
		mShowAnswer.setOnClickListener(new View.OnClickListener() {
			@Override
			public void onClick(View v) {
				updateAnswerTextView(mAnswerIsTrue);
				mAnswerWasShown = true;
				setAnswerShownResult(mAnswerWasShown);
			}
		});
	}
	
    @Override
    public void onSaveInstanceState(Bundle savedInstanceState) {
    	super.onSaveInstanceState(savedInstanceState);
    	savedInstanceState.putBoolean(KEY_CHEATED, mAnswerWasShown);
    }
	
}
