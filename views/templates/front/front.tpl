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
            <input type="radio" name="question" value="1">{$row["Answer_1"]}</br>
            <input type="radio" name="question" value="2">{$row["Answer_2"]}</br>
            <input type="radio" name="question" value="3">{$row["Answer_3"]}</br>
            <input type="radio" name="question" value="4">{$row["Answer_4"]}</br>
          </div>
      {/foreach}
      
      <div class="modal-footer">
        <button type="button" class="btn btn-info btn-lg" onclick="nextQuestion()">NEXT</button>
        <button type="button" class="btn btn-info btn-lg" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>