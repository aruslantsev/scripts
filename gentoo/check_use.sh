for use in $USE; do echo $use; equery h $(echo $use | sed 's/\-//') | wc -l; done | less
