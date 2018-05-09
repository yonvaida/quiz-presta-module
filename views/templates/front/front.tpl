<div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#quizModal">{$Button}</button>

<div id="quizModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">{$Title}</h4>
      </div>

      <div class="modal-body">
             <p>{$Questions["question1"]["question"]}</p>
        <form>
          <input type="radio" id="question1" name="question">{$Questions["question1"]["response1"]}</input></br>
          <input type="radio" id="question2" name="question">{$Questions["question1"]["response2"]}</input></br>
          <input type="radio" id="question3" name="question">{$Questions["question1"]["response3"]}</input></br>
          <input type="radio" id="question4" name="question">{$Questions["question1"]["response4"]}</input></br>
        </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>