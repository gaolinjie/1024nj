from lib.query import Query

class FollowModel(Query):
    def __init__(self, db):
        self.db = db
        self.table_name = "follow"
        super(FollowModel, self).__init__()

    def add_new_follow(self, follow_info):
        return self.data(follow_info).add()

    def get_follow(self, author_id, obj_id, obj_type):
        where = "author_id = %s AND obj_id = %s AND obj_type = '%s'" % (author_id, obj_id, obj_type)
        return self.where(where).find()

    def get_post_all_follows(self, obj_id):
        where = "obj_id = %s AND (obj_type = 'p' OR obj_type = 'q')" % obj_id
        return self.where(where).select()


    def delete_follow_by_id(self, follow_id):
        where = "follow.id = %s " % follow_id
        return self.where(where).delete()

    def delete_follow_by_post_id(self, post_id):
        where = "follow.obj_id = %s AND (follow.obj_type = 'q' OR follow.obj_type = 'p')" % post_id
        return self.where(where).delete()


    def get_user_all_follow_feeds(self, author_id, num = 10, current_page = 1):
        where = "follow.author_id = %s" % author_id
        join = "RIGHT JOIN feed ON ((follow.obj_type = 'u' AND follow.obj_id = feed.user_id ) OR ((follow.obj_type = 'q' OR follow.obj_type = 'p') AND follow.obj_id = feed.post_id AND (feed.feed_type = 2 OR  feed.feed_type = 8)) OR (follow.obj_type = 't' AND follow.obj_id = feed.tag_id)) AND feed.user_id != %s \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id\
                LEFT JOIN follow AS post_follow ON post_follow.author_id = %s AND post.id = post_follow.obj_id AND (post_follow.obj_type='q' OR post_follow.obj_type='p')\
                LEFT JOIN thank AS post_thank ON post_thank.from_user = %s AND post_thank.to_user = post.author_id AND post_thank.obj_id = post.id AND post_thank.obj_type = 'post'\
                LEFT JOIN report AS post_report ON post_report.from_user = %s AND post_report.to_user = post.author_id AND post_report.obj_id = post.id AND post_report.obj_type = 'post'\
                LEFT JOIN thank AS reply_thank ON reply_thank.from_user = %s AND reply_thank.to_user = reply.author_id AND reply_thank.obj_id = reply.id AND reply_thank.obj_type = 'reply'\
                LEFT JOIN report AS reply_report ON reply_report.from_user = %s AND reply_report.to_user = reply.author_id AND reply_report.obj_id = reply.id AND reply_report.obj_type = 'reply'" % (author_id, author_id, author_id, author_id, author_id, author_id)
        order = "feed.created DESC, feed.id DESC"
        group = "feed.id"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                tag.name as tag_name, \
                tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.up_num as post_up_num, \
                post.created as post_created, \
                post_user.username as post_user_username, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                reply.up_num as reply_up_num, \
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign, \
                post_follow.id as post_follow_id, \
                post_thank.id as post_thank_id, \
                post_report.id as post_report_id, \
                reply_thank.id as reply_thank_id, \
                reply_report.id as reply_report_id"
        return self.where(where).order(order).group(group).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_all_follow_and_hot_feeds(self, author_id, num = 10, current_page = 1):
        where = "follow.author_id = %s" % author_id
        join = "RIGHT JOIN feed ON ((follow.obj_type = 'u' AND follow.obj_id = feed.user_id ) OR  (follow.obj_type = 't' AND follow.obj_id = feed.tag_id) OR (feed.feed_type = 4 OR feed.feed_type = 6 OR feed.feed_type = 10 OR feed.feed_type = 12 OR feed.feed_type = 14 OR feed.feed_type = 16)) AND feed.user_id != %s \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id\
                LEFT JOIN follow AS post_follow ON post_follow.author_id = %s AND post.id = post_follow.obj_id AND (post_follow.obj_type='q' OR post_follow.obj_type='p')\
                LEFT JOIN thank AS post_thank ON post_thank.from_user = %s AND post_thank.to_user = post.author_id AND post_thank.obj_id = post.id AND post_thank.obj_type = 'post'\
                LEFT JOIN report AS post_report ON post_report.from_user = %s AND post_report.to_user = post.author_id AND post_report.obj_id = post.id AND post_report.obj_type = 'post'\
                LEFT JOIN thank AS reply_thank ON reply_thank.from_user = %s AND reply_thank.to_user = reply.author_id AND reply_thank.obj_id = reply.id AND reply_thank.obj_type = 'reply'\
                LEFT JOIN report AS reply_report ON reply_report.from_user = %s AND reply_report.to_user = reply.author_id AND reply_report.obj_id = reply.id AND reply_report.obj_type = 'reply'" % (author_id, author_id, author_id, author_id, author_id, author_id)
        order = "feed.created DESC, feed.id DESC"
        group = "feed.id"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                tag.name as tag_name, \
                tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.up_num as post_up_num, \
                post.created as post_created, \
                post_user.username as post_user_username, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                reply.up_num as reply_up_num, \
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign, \
                post_follow.id as post_follow_id, \
                post_thank.id as post_thank_id, \
                post_report.id as post_report_id, \
                reply_thank.id as reply_thank_id, \
                reply_report.id as reply_report_id, \
                follow.obj_type as follow_obj_type, \
                follow.obj_id as follow_obj_id"
        return self.where(where).order(order).group(group).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_all_follow_and_all_post_feeds(self, author_id, num = 30, current_page = 1):
        where = "follow.author_id = %s" % author_id
        join = "RIGHT JOIN feed ON ((follow.obj_type = 'u' AND follow.obj_id = feed.user_id ) OR  (follow.obj_type = 't' AND follow.obj_id = feed.tag_id) OR (feed.feed_type = 1 OR feed.feed_type = 7 OR feed.feed_type = 4 OR feed.feed_type = 6 OR feed.feed_type = 10 OR feed.feed_type = 12 OR feed.feed_type = 14 OR feed.feed_type = 16)) AND (feed.user_id != %s OR  feed.feed_type = 1 OR feed.feed_type = 7)\
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id\
                LEFT JOIN follow AS post_follow ON post_follow.author_id = %s AND post.id = post_follow.obj_id AND (post_follow.obj_type='q' OR post_follow.obj_type='p')\
                LEFT JOIN thank AS post_thank ON post_thank.from_user = %s AND post_thank.to_user = post.author_id AND post_thank.obj_id = post.id AND post_thank.obj_type = 'post'\
                LEFT JOIN report AS post_report ON post_report.from_user = %s AND post_report.to_user = post.author_id AND post_report.obj_id = post.id AND post_report.obj_type = 'post'\
                LEFT JOIN thank AS reply_thank ON reply_thank.from_user = %s AND reply_thank.to_user = reply.author_id AND reply_thank.obj_id = reply.id AND reply_thank.obj_type = 'reply'\
                LEFT JOIN report AS reply_report ON reply_report.from_user = %s AND reply_report.to_user = reply.author_id AND reply_report.obj_id = reply.id AND reply_report.obj_type = 'reply'" % (author_id, author_id, author_id, author_id, author_id, author_id)
        order = "post.updated DESC, feed.created DESC, feed.id DESC"
        group = "feed.id"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                tag.name as tag_name, \
                tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.up_num as post_up_num, \
                post.created as post_created, \
                post.updated as post_updated, \
                post_user.username as post_user_username, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                reply.up_num as reply_up_num, \
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign, \
                post_follow.id as post_follow_id, \
                post_thank.id as post_thank_id, \
                post_report.id as post_report_id, \
                reply_thank.id as reply_thank_id, \
                reply_report.id as reply_report_id, \
                follow.obj_type as follow_obj_type, \
                follow.obj_id as follow_obj_id"
        return self.where(where).order(order).group(group).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_all_follow_post_feeds_count(self, author_id, time1, time2):
        where = "follow.author_id = %s" % author_id
        join = "RIGHT JOIN feed ON ((follow.obj_type = 'q' OR follow.obj_type = 'p') AND follow.obj_id = feed.post_id AND (feed.feed_type = 2 OR  feed.feed_type = 8))  AND feed.user_id != %s AND (feed.created between '%s' and '%s')" % (author_id, time1, time2)
        return self.where(where).join(join).count()

    def get_user_all_follow_post_feeds(self, author_id, num = 10, current_page = 1):
        where = "follow.author_id = %s" % author_id
        join = "RIGHT JOIN feed ON ((follow.obj_type = 'q' OR follow.obj_type = 'p') AND follow.obj_id = feed.post_id AND (feed.feed_type = 2 OR  feed.feed_type = 8))  AND feed.user_id != %s \
                LEFT JOIN user AS author_user ON feed.user_id = author_user.uid \
                LEFT JOIN tag ON feed.tag_id = tag.id \
                LEFT JOIN post ON feed.post_id = post.id \
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid \
                LEFT JOIN reply ON feed.reply_id = reply.id \
                LEFT JOIN user AS reply_user ON reply.author_id = reply_user.uid\
                LEFT JOIN feed_type ON feed.feed_type = feed_type.id\
                LEFT JOIN follow AS post_follow ON post_follow.author_id = %s AND post.id = post_follow.obj_id AND (post_follow.obj_type='q' OR post_follow.obj_type='p')\
                LEFT JOIN thank AS post_thank ON post_thank.from_user = %s AND post_thank.to_user = post.author_id AND post_thank.obj_id = post.id AND post_thank.obj_type = 'post'\
                LEFT JOIN report AS post_report ON post_report.from_user = %s AND post_report.to_user = post.author_id AND post_report.obj_id = post.id AND post_report.obj_type = 'post'\
                LEFT JOIN thank AS reply_thank ON reply_thank.from_user = %s AND reply_thank.to_user = reply.author_id AND reply_thank.obj_id = reply.id AND reply_thank.obj_type = 'reply'\
                LEFT JOIN report AS reply_report ON reply_report.from_user = %s AND reply_report.to_user = reply.author_id AND reply_report.obj_id = reply.id AND reply_report.obj_type = 'reply'" % (author_id, author_id, author_id, author_id, author_id, author_id)
        order = "feed.created DESC, feed.id DESC"
        group = "feed.id"
        field = "feed.*, \
                author_user.username as author_username, \
                author_user.avatar as author_avatar, \
                tag.name as tag_name, \
                tag.thumb as tag_thumb, \
                post.id as post_id, \
                post.title as post_title, \
                post.content as post_content, \
                post.post_type as post_type, \
                post.thumb as post_thumb, \
                post.reply_num as post_reply_num, \
                post.up_num as post_up_num, \
                post.created as post_created, \
                post_user.username as post_user_username, \
                reply.id as reply_id, \
                reply.content as reply_content,\
                reply.up_num as reply_up_num, \
                feed_type.feed_text as feed_text, \
                reply_user.username as reply_user_username, \
                reply_user.sign as reply_user_sign, \
                post_follow.id as post_follow_id, \
                post_thank.id as post_thank_id, \
                post_report.id as post_report_id, \
                reply_thank.id as reply_thank_id, \
                reply_report.id as reply_report_id, \
                follow.obj_type as follow_obj_type, \
                follow.obj_id as follow_obj_id"
        return self.where(where).order(order).group(group).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_follow_hot_posts(self, author_id, num = 10, current_page = 1):
        where = "follow.author_id = %s AND follow.obj_type = 't'" % author_id
        join = "RIGHT JOIN post_tag AS related_post_tag ON follow.obj_id = related_post_tag.tag_id\
                LEFT JOIN post ON related_post_tag.post_id = post.id"
        order = "post.reply_num DESC, post.created DESC, post.id DESC"
        field = "post.*"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_follow_posts(self, author_id, num = 10, current_page = 1):
        where = "follow.author_id = %s AND follow.obj_type = 'p'" % author_id
        join = "LEFT JOIN post ON follow.obj_id = post.id\
                LEFT JOIN user AS post_user ON post.author_id = post_user.uid\
                LEFT JOIN user AS last_reply_user ON post.last_reply = last_reply_user.uid\
                LEFT JOIN post_node ON post.id = post_node.post_id\
                LEFT JOIN node ON post_node.node_id = node.id"
        order = "post.created DESC, post.id DESC"
        field = "post.*,\
                post.id as post_id, \
                post_user.username as author_username, \
                post_user.avatar as author_avatar, \
                last_reply_user.username as last_reply_username, \
                node.name as node_name"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)     

    def get_user_followees(self, view_user, author_id, num = 10, current_page = 1):
        where = "follow.author_id = %s AND follow.obj_id != %s AND follow.obj_type = 'u'" % (view_user, view_user)
        join = "LEFT JOIN user ON follow.obj_id = user.uid\
                LEFT JOIN follow as author_follow ON (author_follow.author_id = %s AND author_follow.obj_id = user.uid AND author_follow.obj_type = 'u')" % author_id
        order = "user.reputation DESC, user.thank_num DESC, user.up_num DESC, user.created DESC"
        field = "user.*"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num) 

    def get_user_followers(self, view_user, author_id, num = 10, current_page = 1):
        where = "follow.obj_id = %s AND follow.author_id != %s  AND follow.obj_type = 'u'" % (view_user, view_user)
        join = "LEFT JOIN user ON follow.author_id = user.uid\
                LEFT JOIN follow as author_follow ON (author_follow.author_id = %s AND author_follow.obj_id = user.uid AND author_follow.obj_type = 'u')" % author_id
        order = "user.reputation DESC, user.thank_num DESC, user.up_num DESC, user.created DESC"
        field = "user.*,\
                author_follow.id as author_follow_id"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_followees2(self, view_user, num = 10, current_page = 1):
        where = "follow.author_id = %s AND follow.obj_id != %s AND follow.obj_type = 'u'" % (view_user, view_user)
        join = "LEFT JOIN user ON follow.obj_id = user.uid"
        order = "user.reputation DESC, user.thank_num DESC, user.up_num DESC, user.created DESC"
        field = "user.*"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num) 

    def get_user_followers2(self, view_user, num = 10, current_page = 1):
        where = "follow.obj_id = %s AND follow.author_id != %s  AND follow.obj_type = 'u'" % (view_user, view_user)
        join = "LEFT JOIN user ON follow.author_id = user.uid"
        order = "user.reputation DESC, user.thank_num DESC, user.up_num DESC, user.created DESC"
        field = "user.*"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_tag_followers(self, view_tag, num = 6, current_page = 1):
        where = "follow.obj_id = %s  AND follow.obj_type = 't'" % view_tag
        join = "LEFT JOIN user ON follow.author_id = user.uid"
        order = "user.reputation DESC, user.thank_num DESC, user.up_num DESC, user.created DESC"
        field = "user.*"
        return self.where(where).order(order).join(join).field(field).pages(current_page = current_page, list_rows = num)

    def get_user_followees_count(self, view_user):
        where = "follow.author_id = %s AND follow.obj_id != %s AND follow.obj_type = 'u'" % (view_user, view_user)
        return self.where(where).count()

    def get_user_followers_count(self, view_user):
        where = "follow.obj_id = %s AND follow.author_id != %s AND follow.obj_type = 'u'" % (view_user, view_user)
        return self.where(where).count()

    def get_tag_followers_count(self, tag_id):
        where = "follow.obj_id = %s AND follow.obj_type = 't'" % tag_id
        return self.where(where).count()

    def get_user_follow_lives_count(self, view_user, time1, time2):
        where = "follow.author_id = %s AND follow.obj_type = 'l'" % view_user
        join = "LEFT JOIN live ON live.date between '%s' and '%s' AND follow.obj_id = live.id" % (time1, time2)
        return self.where(where).join(join).count()

    def get_user_follow_lives(self, view_user, time1, time2):
        where = "follow.author_id = %s AND follow.obj_type = 'l'" % view_user
        join = "LEFT JOIN live ON live.date between '%s' and '%s' AND follow.obj_id = live.id" % (time1, time2)
        order = "live.date ASC, live.id ASC"
        field = "live.*, \
                follow.id as follow_id"
        return self.where(where).order(order).join(join).field(field).select()

    def get_user_follow_tags(self, author_id):
        where = "follow.author_id = %s AND follow.obj_type = 't'" % author_id
        join = "LEFT JOIN tag ON follow.obj_id = tag.id"
        order = "tag.tag_type DESC, tag.id DESC"
        field = "tag.*"
        return self.where(where).order(order).join(join).field(field).select()

    def get_user_follow_posts_count(self, view_user):
        where = "follow.author_id = %s AND follow.obj_type = 'p'" % view_user
        return self.where(where).count()