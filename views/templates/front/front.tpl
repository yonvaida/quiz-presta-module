<div>

<button type="button" class="btn btn-info btn-lg" data-toggle="modal" onclick="nextQuestion(0);" data-target="#quizModal">{$Button}</button>

<div id="quizModal" class="modal fade" role="dialog">
  <div class="modal-dialog" >
   <div class="modal-content" >
      {foreach from=$results item=row}
          <div id="header_{$row['id_Quizmodule']}" class="modal-header" style="display:none;"}>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">{$row["Question"]}</h4>
          </div>
          <div id="body_{$row["id_Quizmodule"]}" class="modal-body" style="display:none; text-align:left">
            <label class="answer"><input type="radio" name="question" value="1" onclick="enable()">{$row["Answer_1"]}</label></br>
            <label class="answer"><input type="radio" name="question" value="2" onclick="enable()">{$row["Answer_2"]}</label></br>
            <label class="answer"><input type="radio" name="question" value="3" onclick="enable()">{$row["Answer_3"]}</label></br>
            <label class="answer"><input type="radio" name="question" value="4" onclick="enable()">{$row["Answer_4"]}</label></br>
          </div>
      {/foreach}
      
      <div class="modal-footer">
        <button type="button" id="nextButton" class="btn btn-info btn-lg" onclick="nextQuestion()" disabled>NEXT</button>
        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>