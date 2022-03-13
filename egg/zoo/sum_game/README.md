
## Sum game
Sum game is derived from the [basic_games](https://github.com/franfranz/EGG/tree/main/egg/zoo/basic_games) tasks, and shares most of their architecture. </br>
In the Sum game task, Sender gets two integers as an input, it sends a message to Receiver, and Receiver must generate an output that equals the sum of the integers. 

The game reads input from files that have the integers to sum (values) on each line, as in [this example file](https://github.com/franfranz/EGG/blob/main/egg/zoo/sum_game/input_data_generation/fullset_train_n5.txt), containing the integers from 0 to 5. 

Here is an example of how to run the sum game. 

```bash
python -m play_sum_v05_03 --mode 'gs' --train_data "fullset_train_n5.txt" --validation_data "train_test_set_n5_S0.txt" --n_attributes 2 --n_values 7 --n_epochs 120 --batch_size 512 --validation_batch_size 1000 --max_len 1 --vocab_size 500 --sender_hidden 256 --receiver_hidden 512 --sender_embedding 5 --receiver_embedding 30 --receiver_cell "gru" --sender_cell "gru" --lr 0.01 --random_seed 1 --temperature 3 --print_validation_events
```

In this particular instance, the following parameters (from basic_games) are invoked:
 * `mode` -- tells whether to use Reinforce (`rf`) or Gumbel-Softmax (`gs`) for training.
 * `train_data/validation_data` -- paths to the files containing training data and validation data (the latter used at each epoch to track the progress of training); both files are in the same format.
 * `n_attributes` -- this is the number of "fields" that the input file vectors have, namely the number of integers to be added in the sum: for example, given the input file linked above, `n_attributes` should be set to 2.
 * `n_values` -- number of distinct values that each input file vector field can take. As we are counting from 0, if the maximum value is 2 (as in the example file above), `n_values` should be set to 3 (and 0 constitutes a possible value).
 * `n_epochs` -- how many times the data in the input training file will be traversed during training: note that they will be traversed in a different random order each time.
 * `batch_size` -- batch size for training data (can't be smaller than number of items in training file).
 * `validation_batch_size` -- batch size for validation data, provided as a separate argument as it is often convenient to traverse the whole validation set in a single step.
 * `max_len` -- after `max_len` symbols without `<eos>` have been emitted by the Sender, an `<eos>` is forced; consequently, the longest possible message will contain `max_len` symbols, followed by `<eos>`.
 * `vocab_size` -- the number of unique symbols in the Sender vocabulary (inluding `<eos>`!).
 * `sender_hidden/receiver_hidden` -- the size of the hidden layers of the agents.
 * `sender_embedding/receiver_embedding` -- output dimensionality of the layer that embeds symbols produced at previous step by the Sender message-emitting/Receiver message-processing recurrent networks, respectively.
 * `sender_cell/receiver_cell` -- type of cell of recurrent networks agents use to emit/process the message.
 * `lr` -- learning rate.
 * `print_validation_events` -- if this flag is passed, after training is done the script will print the validation input, as well as the corresponding messages emitted by Sender and the corresponding Receiver outputs.
 
 To see all arguments that can be passed (and for more information on the ones above), run:
 
 ```bash
python -m play_sum_v05_03 -h
```
