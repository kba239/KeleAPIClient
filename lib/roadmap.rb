module Roadmap

  def get_roadmap(roadmap_id)
    response = self.class.get("https://www.bloc.io/api/v1/roadmaps/#{roadmap_id}",
                              headers: { "authorization" => @token })
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    response = self.class.get("https://www.bloc.io/api/v1/checkpoints/#{checkpoint_id}",
                              headers: { "authorization" => @token })
    JSON.parse(response.body)
  end

  def create_submission(assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)
    response = self.class.post("https://www.bloc.io/api/v1/checkpoint_submissions/#{enrollment_id}",
                              headers: { "authorization" => @token },
                              body: {assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, checkpoint_id: checkpoint_id, comment: comment, enrollment_id: enrollment_id})
    JSON.parse(response.body)
  end

end
